Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979348F6C;
	Thu, 17 Apr 2025 13:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744896092; cv=none; b=VumZAs0sqMe97Rt+3GPbn8dKWIKck1/7CniteIyEZeHim4NTMNGtP3uvXFCSnWIF9RVBdmtLwwiKWuqnlx8PdUMki1UorOCo6lAAT2Z9izhKdkEJNP+M28evqal6UNOkNj+oIaq1g1cad+Mi6/dneFN0KHpJ4IeuHRaysQQexvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744896092; c=relaxed/simple;
	bh=JHS/WvUAYkiKOZ3ZbuG8F3IenA7UGZaubOqqulO3cj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KBaHPCyOl2QgkWhqKozOLxjrNPTXIpy4RRujEw9yXEdGyCaxpi0bVcrBKDxi0P/gk4mI3AarSbAUTg3wURLafdqND1YIiLe8HZrW1QNk6W55fugrYqsi4k4AO7PSfeKEeVvglo8Z3mvBgQ/i9x6tS5W4RrEoLRW+V5PbOFHtuUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XSJYNPP7; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XSJYNPP7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744896090; x=1776432090;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JHS/WvUAYkiKOZ3ZbuG8F3IenA7UGZaubOqqulO3cj0=;
  b=XSJYNPP79y6Xtyn08XOi2eY9dppkrzkRNh89tbPnpieV8NCsp4SUdIFh
   441Y7dfr8FtDclb+BZG4AUh8J9z+8Lzw7tHDC0dsukUh4QcQrxD8pEwIP
   TTKV9lFKG86NyPpzcomIGfNA6yIatCEszdgfpT8vKKAGJeRBzUbnrVMys
   s+RObF4mNS6xl7RA0Sn6lvv+tiN9srMBxv8mMyrieP9AxCV3Hz5uIOENZ
   6XRJ/NIqWSj6z/9qgsj9+2+bKYE1z1w514nlvW1R6zoJUvSyfpin7601V
   uA687Sf6mMdMkcMfVhj0SxW1sg5NehY6KvEra72DdzlX1IdPA82p0O1tM
   g==;
X-CSE-ConnectionGUID: 25nP89YOSY+JNQp4Ocxy6A==
X-CSE-MsgGUID: LhIpnY+PQN6k72XTkfBb8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="50293214"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="50293214"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 06:21:30 -0700
X-CSE-ConnectionGUID: GxMmPHJcTcucnYOH1/a1JQ==
X-CSE-MsgGUID: QlUBjvxBQsaw+2AsscJ4hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="130763412"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Apr 2025 06:21:27 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5PBE-000MoC-1D;
	Thu, 17 Apr 2025 13:21:24 +0000
Date: Thu, 17 Apr 2025 21:20:47 +0800
From: kernel test robot <lkp@intel.com>
To: Xu Yang <xu.yang_2@nxp.com>, krzk@kernel.org, myungjoo.ham@samsung.com,
	cw00.choi@samsung.com, robh@kernel.org, conor+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 2/3] extcon: ptn5150: Add Type-C orientation switch
 support
Message-ID: <202504172148.DEw1gGPg-lkp@intel.com>
References: <20250416105940.1572672-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416105940.1572672-2-xu.yang_2@nxp.com>

Hi Xu,

kernel test robot noticed the following build errors:

[auto build test ERROR on krzk-dt/for-next]
[also build test ERROR on linus/master v6.15-rc2 next-20250417]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xu-Yang/extcon-ptn5150-Add-Type-C-orientation-switch-support/20250416-185917
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git for-next
patch link:    https://lore.kernel.org/r/20250416105940.1572672-2-xu.yang_2%40nxp.com
patch subject: [PATCH 2/3] extcon: ptn5150: Add Type-C orientation switch support
config: parisc-randconfig-001-20250417 (https://download.01.org/0day-ci/archive/20250417/202504172148.DEw1gGPg-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250417/202504172148.DEw1gGPg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504172148.DEw1gGPg-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/extcon/extcon-ptn5150.o: in function `ptn5150_work_sync_and_put':
>> drivers/extcon/extcon-ptn5150.c:252:(.text+0x20): undefined reference to `typec_switch_put'
   hppa-linux-ld: drivers/extcon/extcon-ptn5150.o: in function `ptn5150_check_state':
>> drivers/extcon/extcon-ptn5150.c:104:(.text+0x94): undefined reference to `typec_switch_set'
   hppa-linux-ld: drivers/extcon/extcon-ptn5150.o: in function `ptn5150_irq_work':
   drivers/extcon/extcon-ptn5150.c:180:(.text+0x29c): undefined reference to `typec_switch_set'
   hppa-linux-ld: drivers/extcon/extcon-ptn5150.o: in function `ptn5150_i2c_probe':
>> drivers/extcon/extcon-ptn5150.c:348:(.text+0x618): undefined reference to `fwnode_typec_switch_get'


vim +252 drivers/extcon/extcon-ptn5150.c

    77	
    78	static void ptn5150_check_state(struct ptn5150_info *info)
    79	{
    80		unsigned int port_status, reg_data, vbus;
    81		enum typec_orientation orient = TYPEC_ORIENTATION_NONE;
    82		enum usb_role usb_role = USB_ROLE_NONE;
    83		int ret;
    84	
    85		ret = regmap_read(info->regmap, PTN5150_REG_CC_STATUS, &reg_data);
    86		if (ret) {
    87			dev_err(info->dev, "failed to read CC STATUS %d\n", ret);
    88			return;
    89		}
    90	
    91		orient = FIELD_GET(PTN5150_REG_CC_POLARITY, reg_data);
    92		switch (orient) {
    93		case PTN5150_POLARITY_CC1:
    94			orient = TYPEC_ORIENTATION_NORMAL;
    95			break;
    96		case PTN5150_POLARITY_CC2:
    97			orient = TYPEC_ORIENTATION_REVERSE;
    98			break;
    99		default:
   100			orient = TYPEC_ORIENTATION_NONE;
   101			break;
   102		}
   103	
 > 104		ret = typec_switch_set(info->orient_sw, orient);
   105		if (ret)
   106			dev_err(info->dev, "failed to set orientation: %d\n", ret);
   107	
   108		port_status = FIELD_GET(PTN5150_REG_CC_PORT_ATTACHMENT, reg_data);
   109	
   110		switch (port_status) {
   111		case PTN5150_DFP_ATTACHED:
   112			extcon_set_state_sync(info->edev, EXTCON_USB_HOST, false);
   113			gpiod_set_value_cansleep(info->vbus_gpiod, 0);
   114			extcon_set_state_sync(info->edev, EXTCON_USB, true);
   115			usb_role = USB_ROLE_DEVICE;
   116			break;
   117		case PTN5150_UFP_ATTACHED:
   118			extcon_set_state_sync(info->edev, EXTCON_USB, false);
   119			vbus = FIELD_GET(PTN5150_REG_CC_VBUS_DETECTION, reg_data);
   120			if (vbus)
   121				gpiod_set_value_cansleep(info->vbus_gpiod, 0);
   122			else
   123				gpiod_set_value_cansleep(info->vbus_gpiod, 1);
   124	
   125			extcon_set_state_sync(info->edev, EXTCON_USB_HOST, true);
   126			usb_role = USB_ROLE_HOST;
   127			break;
   128		default:
   129			break;
   130		}
   131	
   132		if (usb_role) {
   133			ret = usb_role_switch_set_role(info->role_sw, usb_role);
   134			if (ret)
   135				dev_err(info->dev, "failed to set %s role: %d\n",
   136					usb_role_string(usb_role), ret);
   137		}
   138	}
   139	
   140	static void ptn5150_irq_work(struct work_struct *work)
   141	{
   142		struct ptn5150_info *info = container_of(work,
   143				struct ptn5150_info, irq_work);
   144		int ret = 0;
   145		unsigned int int_status;
   146	
   147		if (!info->edev)
   148			return;
   149	
   150		mutex_lock(&info->mutex);
   151	
   152		/* Clear interrupt. Read would clear the register */
   153		ret = regmap_read(info->regmap, PTN5150_REG_INT_STATUS, &int_status);
   154		if (ret) {
   155			dev_err(info->dev, "failed to read INT STATUS %d\n", ret);
   156			mutex_unlock(&info->mutex);
   157			return;
   158		}
   159	
   160		if (int_status) {
   161			unsigned int cable_attach;
   162	
   163			cable_attach = int_status & PTN5150_REG_INT_CABLE_ATTACH_MASK;
   164			if (cable_attach) {
   165				ptn5150_check_state(info);
   166			} else {
   167				extcon_set_state_sync(info->edev,
   168						EXTCON_USB_HOST, false);
   169				extcon_set_state_sync(info->edev,
   170						EXTCON_USB, false);
   171				gpiod_set_value_cansleep(info->vbus_gpiod, 0);
   172	
   173				ret = usb_role_switch_set_role(info->role_sw,
   174							       USB_ROLE_NONE);
   175				if (ret)
   176					dev_err(info->dev,
   177						"failed to set none role: %d\n",
   178						ret);
   179	
   180				ret = typec_switch_set(info->orient_sw,
   181						       TYPEC_ORIENTATION_NONE);
   182				if (ret)
   183					dev_err(info->dev,
   184						"failed to set orientation: %d\n", ret);
   185			}
   186		}
   187	
   188		/* Clear interrupt. Read would clear the register */
   189		ret = regmap_read(info->regmap, PTN5150_REG_INT_REG_STATUS,
   190				&int_status);
   191		if (ret) {
   192			dev_err(info->dev,
   193				"failed to read INT REG STATUS %d\n", ret);
   194			mutex_unlock(&info->mutex);
   195			return;
   196		}
   197	
   198		mutex_unlock(&info->mutex);
   199	}
   200	
   201	
   202	static irqreturn_t ptn5150_irq_handler(int irq, void *data)
   203	{
   204		struct ptn5150_info *info = data;
   205	
   206		schedule_work(&info->irq_work);
   207	
   208		return IRQ_HANDLED;
   209	}
   210	
   211	static int ptn5150_init_dev_type(struct ptn5150_info *info)
   212	{
   213		unsigned int reg_data, vendor_id, version_id;
   214		int ret;
   215	
   216		ret = regmap_read(info->regmap, PTN5150_REG_DEVICE_ID, &reg_data);
   217		if (ret) {
   218			dev_err(info->dev, "failed to read DEVICE_ID %d\n", ret);
   219			return -EINVAL;
   220		}
   221	
   222		vendor_id = FIELD_GET(PTN5150_REG_DEVICE_ID_VENDOR, reg_data);
   223		version_id = FIELD_GET(PTN5150_REG_DEVICE_ID_VERSION, reg_data);
   224		dev_dbg(info->dev, "Device type: version: 0x%x, vendor: 0x%x\n",
   225			version_id, vendor_id);
   226	
   227		/* Clear any existing interrupts */
   228		ret = regmap_read(info->regmap, PTN5150_REG_INT_STATUS, &reg_data);
   229		if (ret) {
   230			dev_err(info->dev,
   231				"failed to read PTN5150_REG_INT_STATUS %d\n",
   232				ret);
   233			return -EINVAL;
   234		}
   235	
   236		ret = regmap_read(info->regmap, PTN5150_REG_INT_REG_STATUS, &reg_data);
   237		if (ret) {
   238			dev_err(info->dev,
   239				"failed to read PTN5150_REG_INT_REG_STATUS %d\n", ret);
   240			return -EINVAL;
   241		}
   242	
   243		return 0;
   244	}
   245	
   246	static void ptn5150_work_sync_and_put(void *data)
   247	{
   248		struct ptn5150_info *info = data;
   249	
   250		cancel_work_sync(&info->irq_work);
   251		usb_role_switch_put(info->role_sw);
 > 252		typec_switch_put(info->orient_sw);
   253	}
   254	
   255	static int ptn5150_i2c_probe(struct i2c_client *i2c)
   256	{
   257		struct device *dev = &i2c->dev;
   258		struct device_node *np = i2c->dev.of_node;
   259		struct fwnode_handle *connector;
   260		struct ptn5150_info *info;
   261		int ret;
   262	
   263		if (!np)
   264			return -EINVAL;
   265	
   266		info = devm_kzalloc(&i2c->dev, sizeof(*info), GFP_KERNEL);
   267		if (!info)
   268			return -ENOMEM;
   269		i2c_set_clientdata(i2c, info);
   270	
   271		info->dev = &i2c->dev;
   272		info->i2c = i2c;
   273		info->vbus_gpiod = devm_gpiod_get(&i2c->dev, "vbus", GPIOD_OUT_LOW);
   274		if (IS_ERR(info->vbus_gpiod)) {
   275			ret = PTR_ERR(info->vbus_gpiod);
   276			if (ret == -ENOENT) {
   277				dev_info(dev, "No VBUS GPIO, ignoring VBUS control\n");
   278				info->vbus_gpiod = NULL;
   279			} else {
   280				return dev_err_probe(dev, ret, "failed to get VBUS GPIO\n");
   281			}
   282		}
   283	
   284		mutex_init(&info->mutex);
   285	
   286		INIT_WORK(&info->irq_work, ptn5150_irq_work);
   287	
   288		info->regmap = devm_regmap_init_i2c(i2c, &ptn5150_regmap_config);
   289		if (IS_ERR(info->regmap)) {
   290			return dev_err_probe(info->dev, PTR_ERR(info->regmap),
   291					     "failed to allocate register map\n");
   292		}
   293	
   294		if (i2c->irq > 0) {
   295			info->irq = i2c->irq;
   296		} else {
   297			info->int_gpiod = devm_gpiod_get(&i2c->dev, "int", GPIOD_IN);
   298			if (IS_ERR(info->int_gpiod)) {
   299				return dev_err_probe(dev, PTR_ERR(info->int_gpiod),
   300						     "failed to get INT GPIO\n");
   301			}
   302	
   303			info->irq = gpiod_to_irq(info->int_gpiod);
   304			if (info->irq < 0) {
   305				dev_err(dev, "failed to get INTB IRQ\n");
   306				return info->irq;
   307			}
   308		}
   309	
   310		ret = devm_request_threaded_irq(dev, info->irq, NULL,
   311						ptn5150_irq_handler,
   312						IRQF_TRIGGER_FALLING |
   313						IRQF_ONESHOT,
   314						i2c->name, info);
   315		if (ret < 0) {
   316			dev_err(dev, "failed to request handler for INTB IRQ\n");
   317			return ret;
   318		}
   319	
   320		/* Allocate extcon device */
   321		info->edev = devm_extcon_dev_allocate(info->dev, ptn5150_extcon_cable);
   322		if (IS_ERR(info->edev)) {
   323			dev_err(info->dev, "failed to allocate memory for extcon\n");
   324			return -ENOMEM;
   325		}
   326	
   327		/* Register extcon device */
   328		ret = devm_extcon_dev_register(info->dev, info->edev);
   329		if (ret) {
   330			dev_err(info->dev, "failed to register extcon device\n");
   331			return ret;
   332		}
   333	
   334		extcon_set_property_capability(info->edev, EXTCON_USB,
   335						EXTCON_PROP_USB_VBUS);
   336		extcon_set_property_capability(info->edev, EXTCON_USB_HOST,
   337						EXTCON_PROP_USB_VBUS);
   338		extcon_set_property_capability(info->edev, EXTCON_USB_HOST,
   339						EXTCON_PROP_USB_TYPEC_POLARITY);
   340	
   341		/* Initialize PTN5150 device and print vendor id and version id */
   342		ret = ptn5150_init_dev_type(info);
   343		if (ret)
   344			return -EINVAL;
   345	
   346		connector = device_get_named_child_node(dev, "connector");
   347		if (connector) {
 > 348			info->orient_sw = fwnode_typec_switch_get(connector);
   349			if (IS_ERR(info->orient_sw))
   350				return dev_err_probe(info->dev, PTR_ERR(info->orient_sw),
   351						"failed to get orientation switch\n");
   352		}
   353	
   354		info->role_sw = usb_role_switch_get(info->dev);
   355		if (IS_ERR(info->role_sw))
   356			return dev_err_probe(info->dev, PTR_ERR(info->role_sw),
   357					     "failed to get role switch\n");
   358	
   359		ret = devm_add_action_or_reset(dev, ptn5150_work_sync_and_put, info);
   360		if (ret)
   361			return ret;
   362	
   363		/*
   364		 * Update current extcon state if for example OTG connection was there
   365		 * before the probe
   366		 */
   367		mutex_lock(&info->mutex);
   368		ptn5150_check_state(info);
   369		mutex_unlock(&info->mutex);
   370	
   371		return 0;
   372	}
   373	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
