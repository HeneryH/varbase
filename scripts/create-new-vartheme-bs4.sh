
#!//bin/bash
################################################################################
## Create new Vartheme BS4 Sub-Theme.
################################################################################
##
## Quick tip on how to use this script command file.
##
## Create new Vartheme BS4 sub theme for a project.
## By Bash:
## -----------------------------------------------------------------------------
## cd PROJECT_DIR_NAME/docroot/themes/contrib/vartheme_bs4/scripts
## bash ./create-new-vartheme-bs4.sh "THEME_NAME"
##------------------------------------------------------------------------------
##
##
################################################################################

# Basic yaml parser.
parse_yaml() {
   local s='[[:space:]]*' w='[a-zA-Z0-9_]*' fs=$(echo @|tr @ '\034')
   sed -ne "s|^\($s\)\($w\)$s:$s\"\(.*\)\"$s\$|\1$fs\2$fs\3|p" \
        -e "s|^\($s\)\($w\)$s:$s\(.*\)$s\$|\1$fs\2$fs\3|p"  $1 |
   awk -F$fs '{
      indent = length($1)/2;
      vname[indent] = $2;
      for (i in vname) {if (i > indent) {delete vname[i]}}
      if (length($3) > 0) {
         vn=""; for (i=0; i<indent; i++) {vn=(vn)(vname[i])("_")}
         printf("%s%s%s=\"%s\"\n", "",vn, $2, $3);
      }
   }'
}

current_path=$(pwd);
drupal_root="$current_path";

if [[ "${drupal_root: -1}" == "/" ]]; then
  drupal_root="${drupal_root::-1}";
fi

if [[ "${drupal_root: -24}" == "profiles/varbase/scripts" ]]; then
  drupal_root="${drupal_root::-24}";
fi

if [[ "${drupal_root: -16}" == "profiles/varbase" ]]; then
  drupal_root="${drupal_root::-16}";
fi

if [[ "${drupal_root: -8}" == "profiles" ]]; then
  drupal_root="${drupal_root::-8}";
fi

if [[ "${drupal_root: -1}" == "/" ]]; then
  drupal_root="${drupal_root::-1}";
fi

echo "Current path: $current_path";
echo "Drupal root: $drupal_root";

# Read scripts.settings.yml file
eval $(parse_yaml $drupal_root/profiles/varbase/scripts/scripts.settings.yml);

# Default theme name.
theme_name=$default_theme_name;

# Grape the theme name argument.
if [ ! -z "$1" ]; then
  arg1="$1";
  if [[ $arg1 =~ ^[A-Za-z][A-Za-z0-9_]*$ ]]; then
    theme_name="$arg1";
  else
    echo "---------------------------------------------------------------------------";
    echo "   Theme name is not a valid theme name!                                   ";
    echo "---------------------------------------------------------------------------";
    exit 1;
  fi
else
  echo "---------------------------------------------------------------------------";
  echo "   Please add the name of your theme!                                      ";
  echo "---------------------------------------------------------------------------";
  exit 1;
fi


# Default themes creation path.
theme_path=$drupal_root/$default_themes_creation_path;
mkdir -p ${theme_path};

# Create the new Vartheme BS4 subtheme if we do not have a folder with that name yet.
if [[ ! -d "$theme_path/$theme_name" ]]; then

  # 1. Copy the VARTHEME_BS4_SUBTHEME folder to your custom theme location.
  cp -r ${drupal_root}/themes/contrib/vartheme_bs4/VARTHEME_BS4_SUBTHEME ${theme_path}/${theme_name};

  # 2. Rename VARTHEME_BS4_SUBTHEME.starterkit.yml your_subtheme_name.info.yml
  mv ${theme_path}/${theme_name}/VARTHEME_BS4_SUBTHEME.starterkit.yml ${theme_path}/${theme_name}/VARTHEME_BS4_SUBTHEME.info.yml ;
  mv ${theme_path}/${theme_name}/VARTHEME_BS4_SUBTHEME.info.yml ${theme_path}/${theme_name}/${theme_name}.info.yml ;

  # 3. Rename VARTHEME_BS4_SUBTHEME.libraries.yml your_subtheme_name.libraries.yml
  mv ${theme_path}/${theme_name}/VARTHEME_BS4_SUBTHEME.libraries.yml ${theme_path}/${theme_name}/${theme_name}.libraries.yml ;

  # 4. Rename VARTHEME_BS4_SUBTHEME.theme your_subtheme_name.theme
  mv ${theme_path}/${theme_name}/VARTHEME_BS4_SUBTHEME.theme ${theme_path}/${theme_name}/${theme_name}.theme ;

  # 5. Rename VARTHEME_BS4_SUBTHEME.settings.yml
  mv ${theme_path}/${theme_name}/config/install/VARTHEME_BS4_SUBTHEME.settings.yml ${theme_path}/${theme_name}/config/install/${theme_name}.settings.yml ;

  # 6. Rename VARTHEME_BS4_SUBTHEME.schema.yml
  mv ${theme_path}/${theme_name}/config/schema/VARTHEME_BS4_SUBTHEME.schema.yml ${theme_path}/${theme_name}/config/schema/${theme_name}.schema.yml ;

  # 6. Rename VARTHEME_BS4_SUBTHEME.base.scss and VARTHEME_BS4_SUBTHEME.base.css
  mv ${theme_path}/${theme_name}/scss/base/VARTHEME_BS4_SUBTHEME.base.scss ${theme_path}/${theme_name}/scss/base/${theme_name}.base.scss ;
  mv ${theme_path}/${theme_name}/css/base/VARTHEME_BS4_SUBTHEME.base.css ${theme_path}/${theme_name}/css/base/${theme_name}.base.css ;

  # 6. Rename VARTHEME_BS4_SUBTHEME.base.scss and VARTHEME_BS4_SUBTHEME.base.css
  mv ${theme_path}/${theme_name}/scss/rtl/base/VARTHEME_BS4_SUBTHEME-rtl.base.scss ${theme_path}/${theme_name}/scss/rtl/base/${theme_name}.base.scss ;
  mv ${theme_path}/${theme_name}/css/rtl/base/VARTHEME_BS4_SUBTHEME-rtl.base.css ${theme_path}/${theme_name}/css/rtl/base/${theme_name}.base.css ;



  # 7 Rename TWIG template files.
  # html.html.twig is very important and needed file for RTL websites.
  mv ${theme_path}/${theme_name}/templates/system/html.html.twig-VARTHEME_BS4_SUBTHEME ${theme_path}/${theme_name}/templates/system/html.html.twig
  mv ${theme_path}/${theme_name}/templates/system/page.html.twig-VARTHEME_BS4_SUBTHEME ${theme_path}/${theme_name}/templates/system/page.html.twig
  mv ${theme_path}/${theme_name}/templates/system/maintenance-page.html.twig-VARTHEME_BS4_SUBTHEME ${theme_path}/${theme_name}/templates/system/maintenance-page.html.twig


  # Custom Better Login templates for edit, login, rest password, and register template files.
  mv ${theme_path}/${theme_name}/templates/betterlogin/page--user--edit.html.twig-VARTHEME_BS4_SUBTHEME ${theme_path}/${theme_name}/templates/betterlogin/page--user--edit.html.twig
  mv ${theme_path}/${theme_name}/templates/betterlogin/page--user--login.html.twig-VARTHEME_BS4_SUBTHEME ${theme_path}/${theme_name}/templates/betterlogin/page--user--login.html.twig
  mv ${theme_path}/${theme_name}/templates/betterlogin/page--user--password.html.twig-VARTHEME_BS4_SUBTHEME ${theme_path}/${theme_name}/templates/betterlogin/page--user--password.html.twig
  mv ${theme_path}/${theme_name}/templates/betterlogin/page--user--register.html.twig-VARTHEME_BS4_SUBTHEME ${theme_path}/${theme_name}/templates/betterlogin/page--user--register.html.twig
  mv ${theme_path}/${theme_name}/templates/betterlogin/page--user--reset.html.twig-VARTHEME_BS4_SUBTHEME ${theme_path}/${theme_name}/templates/betterlogin/page--user--reset.html.twig
  mv ${theme_path}/${theme_name}/templates/betterlogin/block--social-auth.html.twig-VARTHEME_BS4_SUBTHEME ${theme_path}/${theme_name}/templates/betterlogin/block--social-auth.html.twig


  mv ${theme_path}/${theme_name}/templates/entity-embed/entity-embed-container.html.twig-VARTHEME_BS4_SUBTHEME ${theme_path}/${theme_name}/templates/entity-embed/entity-embed-container.html.twig

  mv ${theme_path}/${theme_name}/templates/media/media.html.twig-VARTHEME_BS4_SUBTHEME ${theme_path}/${theme_name}/templates/media/media.html.twig
  mv ${theme_path}/${theme_name}/templates/media/media--image.html.twig-VARTHEME_BS4_SUBTHEME ${theme_path}/${theme_name}/templates/media/media--image.html.twig
  mv ${theme_path}/${theme_name}/templates/media/media-oembed-iframe.html.twig-VARTHEME_BS4_SUBTHEME ${theme_path}/${theme_name}/templates/media/media-oembed-iframe.html.twig

  mv ${theme_path}/${theme_name}/templates/video-embed-field/video-embed-iframe.html.twig-VARTHEME_BS4_SUBTHEME ${theme_path}/${theme_name}/templates/video-embed-field/video-embed-iframe.html.twig


  # 8. Replace all VARTHEME_BS4_SUBTHEME with the machine name of your theme.
  grep -rl 'VARTHEME_BS4_SUBTHEME' ${theme_path}/${theme_name} | xargs sed -i "s/VARTHEME_BS4_SUBTHEME/${theme_name}/g" ;


  # 9. Install needed libraries
  cd ${theme_path}/${theme_name};
  npm install;

  generated_datetime="$(date '+%Y/%m/%d - %H:%M:%S')";
  generated_log=" Generated by -- create-new-vartheme ${theme_name} ${direction} ${theme_path} -- on ${generated_datetime}";
  echo "${generated_log}"  >> ${theme_path}/${theme_name}/README.md;

  echo "---------------------------------------------------------------------------";
  echo "   The new Vartheme BS4 Sub-Theme were created at \"${theme_path}/${theme_name} :)\" ";
  echo "---------------------------------------------------------------------------";
  exit 0;

else
  echo "---------------------------------------------------------------------------";
  echo "   The folder \"${theme_path}/${theme_name}\" is already in the site!";
  echo "---------------------------------------------------------------------------";
  exit 1;
fi
