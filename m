Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1B9306D52
	for <imx@lists.linux.dev>; Mon, 15 Sep 2025 12:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757938978; cv=none; b=mdZufbgWTs0dYMJ1+eYVNdjrSEhYY0thuV636TxjANXCQaoOc5k/GEhGgDMqoHnm8FMdYCECwRIjyqr3Xed4hPpYjv5XR8eMTgnInSG8RXmd5Kcq4OUNjNFMm+Ua1xte0ySRlnQNjCWWeD1VZ0D7RdURXzqeUyX/TydwIE8kRP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757938978; c=relaxed/simple;
	bh=SmrCL28GAjsbU/AGRJmWPNTDM+wz8OJR28D+aH2m6qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LV2INAYaBVRWN94lEB9LzPubHZT9h7P5f494LwcOWRfiwHLHthY60NpvRZjKmXhqjplCWJGLauWwj4dqHlxOALIJ2pno11Q4pQKehxCNsbbmpOZkwESN+N4O8xf2q0DmrteTCX0hqKkOayiUPpq7m+rBN+tNlfExkfQd5GXsMwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XlnGu/QN; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XlnGu/QN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757938976; x=1789474976;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SmrCL28GAjsbU/AGRJmWPNTDM+wz8OJR28D+aH2m6qc=;
  b=XlnGu/QNFXefrnYnf9yHLiVSCK+xRBkpRQ0f7Gy2+kX1JYoqLRzh1que
   It+cO0Sk+YJiLPqH2bsbmQXS3u7UCf0fAfGayC6dOW7EU3rASV0sIYCg7
   KDRMvQj7BlO/tUEBuBNQx3KZ2XYiS8QNHysdVs1S/AI3qh7P8hLwqFfoB
   02gwMH00ep5L5tUySP9eAgm96tlNIf0luEtKsMTZFlo3IBJUUGHn0TckX
   EHiILuSKuyCcd5/huZOVxc277/hBtMGTZNWQkdLME4aKEuwy7Odi1itU+
   NlZvxnc3y8Nafh31VJ7mvdW7qoTOyYSQabFo2ly/2N2oM6JDWj0j/exjq
   g==;
X-CSE-ConnectionGUID: XrHM2ZrvSVyHIbbHEBv5PA==
X-CSE-MsgGUID: nStIhEegQZGBi9kVnry9JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="64008127"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="64008127"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 05:22:55 -0700
X-CSE-ConnectionGUID: ll7eqTNTSJ2IfOduqdCFdg==
X-CSE-MsgGUID: NXKsOtBPSHWvh9ShbfKDSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="173757220"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa006.jf.intel.com with SMTP; 15 Sep 2025 05:22:53 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 15 Sep 2025 15:22:51 +0300
Date: Mon, 15 Sep 2025 15:22:51 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: badhri@google.com, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2] usb: typec: tcpci: add wakeup support
Message-ID: <aMgFG9WRBqOe5POT@kuha.fi.intel.com>
References: <20250910105042.695146-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910105042.695146-1-xu.yang_2@nxp.com>

On Wed, Sep 10, 2025 at 06:50:42PM +0800, Xu Yang wrote:
> Add wakeup support for tcpci. If the user enables the wakeup file, call
> enable_irq_wake() during system suspend and disable_irq_wake() during
> system resume. Since this driver supports shared interrupts, mask the
> chip interrupt by default when wakeup is disabled to avoid affecting
> other IRQ users.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes in v2:
>  - improve commit message
>  - add Rb tag
> ---
>  drivers/usb/typec/tcpm/tcpci.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index a56e31b20c21..2a951c585e92 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -949,6 +949,8 @@ static int tcpci_probe(struct i2c_client *client)
>  	if (err < 0)
>  		goto unregister_port;
>  
> +	device_set_wakeup_capable(chip->tcpci->dev, true);
> +
>  	return 0;
>  
>  unregister_port:
> @@ -969,6 +971,36 @@ static void tcpci_remove(struct i2c_client *client)
>  	tcpci_unregister_port(chip->tcpci);
>  }
>  
> +static int tcpci_suspend(struct device *dev)
> +{
> +	struct i2c_client *i2c = to_i2c_client(dev);
> +	struct tcpci_chip *chip = i2c_get_clientdata(i2c);
> +	int ret;
> +
> +	if (device_may_wakeup(dev))
> +		ret = enable_irq_wake(i2c->irq);
> +	else
> +		ret = tcpci_write16(chip->tcpci, TCPC_ALERT_MASK, 0);
> +
> +	return ret;
> +}
> +
> +static int tcpci_resume(struct device *dev)
> +{
> +	struct i2c_client *i2c = to_i2c_client(dev);
> +	struct tcpci_chip *chip = i2c_get_clientdata(i2c);
> +	int ret;
> +
> +	if (device_may_wakeup(dev))
> +		ret = disable_irq_wake(i2c->irq);
> +	else
> +		ret = tcpci_write16(chip->tcpci, TCPC_ALERT_MASK, chip->tcpci->alert_mask);
> +
> +	return ret;
> +}
> +
> +DEFINE_SIMPLE_DEV_PM_OPS(tcpci_pm_ops, tcpci_suspend, tcpci_resume);
> +
>  static const struct i2c_device_id tcpci_id[] = {
>  	{ "tcpci" },
>  	{ }
> @@ -987,6 +1019,7 @@ MODULE_DEVICE_TABLE(of, tcpci_of_match);
>  static struct i2c_driver tcpci_i2c_driver = {
>  	.driver = {
>  		.name = "tcpci",
> +		.pm = pm_sleep_ptr(&tcpci_pm_ops),
>  		.of_match_table = of_match_ptr(tcpci_of_match),
>  	},
>  	.probe = tcpci_probe,
> -- 
> 2.34.1

-- 
heikki
