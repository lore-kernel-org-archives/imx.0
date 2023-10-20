Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0148C847D
	for <imx@lists.linux.dev>; Fri, 20 Oct 2023 08:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kd+QWSGk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697792134; x=1729328134;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ldKD9vWG59M8ubPGySLlaVJYtWih/t+41frfCeRocik=;
  b=Kd+QWSGkdRu5/ZN2XJEF3GPoIknT1E5YmAqmpqAf1LN7pY/kxJF41bXs
   P8H86hKSImmgWqtD8I1dV0az1BQvS48BRrXdvwKP/b97so7S6DOQ4hmZR
   EpZ+R8NSfBe2o7At8BBMr7ImQNyHdIGFqg336m+lxSaTtfh17xBPcn0v/
   v+o+3Lhvnx67k6u0uhIfnuzDqlfDjWlff6aeV55OHnlpq4MFrgCTKfaON
   UoPMWEgomE9UNijakmfzZ8YFf/BbpTwnePUUuXHkqnISeZFRFVgyRhMID
   l90+WtaXJKp2+yfDPSxqakXwJ1Cyscxydits2ocDTTYKovCYT4429Pha9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="366690150"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="366690150"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 01:55:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="750855353"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="750855353"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 01:55:32 -0700
Received: from [10.252.61.130] (zlukwins-mobl.ger.corp.intel.com [10.252.61.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 2B53C580BE3;
	Fri, 20 Oct 2023 01:55:29 -0700 (PDT)
Message-ID: <57efe6de-cf65-32ed-fd1e-a388e1676c70@linux.intel.com>
Date: Fri, 20 Oct 2023 10:55:27 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 1/6] i3c: master: add enable(disable) hot join in sys
 entry
Content-Language: en-US
To: Frank Li <Frank.Li@nxp.com>, miquel.raynal@bootlin.com
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20231018205929.3435110-1-Frank.Li@nxp.com>
 <20231018205929.3435110-2-Frank.Li@nxp.com>
From: "Zbigniew, Lukwinski" <zbigniew.lukwinski@linux.intel.com>
In-Reply-To: <20231018205929.3435110-2-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/18/2023 10:59 PM, Frank Li wrote:
> Add hotjoin entry in sys file system allow user enable/disable hotjoin
> feature.
>
> Add (*enable(disable)_hotjoin)() to i3c_master_controller_ops.
> Add api i3c_master_enable(disable)_hotjoin();

What is the use case for having HJ enable knob in sysfs available for 
user space other than for debug stuff? In other words, does user space 
really need to enable/disable HJ in runtime for other reason but debug? 
If it is only for debug maybe it  could be move to debugFS?

I think that maybe HJ enable knob shall be available in DT so you could 
control the default state for this feature also at compilation phase?

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>   drivers/i3c/master.c       | 84 ++++++++++++++++++++++++++++++++++++++
>   include/linux/i3c/master.h |  5 +++
>   2 files changed, 89 insertions(+)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 08aeb69a78003..ed5e27cd20811 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -526,6 +526,89 @@ static ssize_t i2c_scl_frequency_show(struct device *dev,
>   }
>   static DEVICE_ATTR_RO(i2c_scl_frequency);
>   
> +static int i3c_set_hotjoin(struct i3c_master_controller *master, bool enable)
> +{
> +	int ret;
> +
> +	if (!master ||
> +	    !master->ops ||
> +	    !master->ops->enable_hotjoin ||
> +	    !master->ops->disable_hotjoin
> +	   )
> +		return -EINVAL;
> +
> +	i3c_bus_normaluse_lock(&master->bus);
> +
> +	if (enable)
> +		ret = master->ops->enable_hotjoin(master);
> +	else
> +		ret = master->ops->disable_hotjoin(master);
> +
> +	master->hotjoin = enable;
> +
> +	i3c_bus_normaluse_unlock(&master->bus);
> +
> +	return ret;
> +}
> +
> +static ssize_t hotjoin_store(struct device *dev, struct device_attribute *attr,
> +			     const char *buf, size_t count)
> +{
> +	struct i3c_bus *i3cbus = dev_to_i3cbus(dev);
> +	int ret;
> +	long res;
> +
> +	if (!i3cbus->cur_master)
> +		return -EINVAL;
> +
> +	if (kstrtol(buf, 10, &res))
> +		return -EINVAL;
> +
> +	ret = i3c_set_hotjoin(i3cbus->cur_master->common.master, !!res);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +/*
> + * i3c_master_enable_hotjoin - Enable hotjoin
> + * @master: I3C master object
> + *
> + * Return: a 0 in case of success, an negative error code otherwise.
> + */
> +int i3c_master_enable_hotjoin(struct i3c_master_controller *master)
> +{
> +	return i3c_set_hotjoin(master, true);
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_enable_hotjoin);
> +
> +/*
> + * i3c_master_disable_hotjoin - Disable hotjoin
> + * @master: I3C master object
> + *
> + * Return: a 0 in case of success, an negative error code otherwise.
> + */
> +int i3c_master_disable_hotjoin(struct i3c_master_controller *master)
> +{
> +	return i3c_set_hotjoin(master, false);
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_disable_hotjoin);
> +
> +static ssize_t hotjoin_show(struct device *dev, struct device_attribute *da, char *buf)
> +{
> +	struct i3c_bus *i3cbus = dev_to_i3cbus(dev);
> +	ssize_t ret;
> +
> +	i3c_bus_normaluse_lock(i3cbus);
> +	ret = sysfs_emit(buf, "%d\n", i3cbus->cur_master->common.master->hotjoin);
> +	i3c_bus_normaluse_unlock(i3cbus);
> +
> +	return ret;
> +}
> +
> +static DEVICE_ATTR_RW(hotjoin);
> +
>   static struct attribute *i3c_masterdev_attrs[] = {
>   	&dev_attr_mode.attr,
>   	&dev_attr_current_master.attr,
> @@ -536,6 +619,7 @@ static struct attribute *i3c_masterdev_attrs[] = {
>   	&dev_attr_pid.attr,
>   	&dev_attr_dynamic_address.attr,
>   	&dev_attr_hdrcap.attr,
> +	&dev_attr_hotjoin.attr,
>   	NULL,
>   };
>   ATTRIBUTE_GROUPS(i3c_masterdev);
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index 0b52da4f23467..65b8965968af2 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -452,6 +452,8 @@ struct i3c_master_controller_ops {
>   	int (*disable_ibi)(struct i3c_dev_desc *dev);
>   	void (*recycle_ibi_slot)(struct i3c_dev_desc *dev,
>   				 struct i3c_ibi_slot *slot);
> +	int (*enable_hotjoin)(struct i3c_master_controller *master);
> +	int (*disable_hotjoin)(struct i3c_master_controller *master);
>   };
>   
>   /**
> @@ -487,6 +489,7 @@ struct i3c_master_controller {
>   	const struct i3c_master_controller_ops *ops;
>   	unsigned int secondary : 1;
>   	unsigned int init_done : 1;
> +	unsigned int hotjoin: 1;
>   	struct {
>   		struct list_head i3c;
>   		struct list_head i2c;
> @@ -543,6 +546,8 @@ int i3c_master_register(struct i3c_master_controller *master,
>   			const struct i3c_master_controller_ops *ops,
>   			bool secondary);
>   void i3c_master_unregister(struct i3c_master_controller *master);
> +int i3c_master_enable_hotjoin(struct i3c_master_controller *master);
> +int i3c_master_disable_hotjoin(struct i3c_master_controller *master);
>   
>   /**
>    * i3c_dev_get_master_data() - get master private data attached to an I3C
