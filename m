Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A100569F
	for <imx@lists.linux.dev>; Sun,  4 Jun 2023 23:17:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E34EC433EF;
	Sun,  4 Jun 2023 23:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685920643;
	bh=lLXxhmHuTpdEgjdhdN6kOgGjwZKnjXgDZ9PMqOVOxGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TlMd9+z3vTNafqIAYi30n98Uk81wQ3uVB68YECbeKRR4n72dR1smtw/VKusB7BpZp
	 awaVyL2szpCSklWDSh6QaqDxxzkwQZE5M6QfZNv7hFIWHnejwo4nUfll0HqHSg7YRo
	 K9hqVFIBmUh2qGOl7SPgLz5bPaPgou4x5miyGXunBPPh3KebkaYDvDjZw4353aDnO7
	 F84M39eTtj0CTe5YaFjfSy2sF4RVSccz/KPtd+BZ4bc2qv5ER1nJMJW7zbgnjGSJx9
	 BZKPxk6osau9bO7Kpbh3fzvuTq57dybRU0swqSdMLglTqNKsaK4pgtTLLU8nkIlXcm
	 Tb5WtITAk5ssA==
Date: Mon, 5 Jun 2023 07:17:11 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Pawel Laszczak <pawell@cadence.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Roger Quadros <rogerq@kernel.org>,
	Aswath Govindraju <a-govindraju@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	Frank Li <frank.li@nxp.com>
Subject: Re: [PATCH] usb: cdns3: imx: Rework system PM to avoid duplicated
 operations
Message-ID: <20230604231711.GD258497@nchen-desktop>
References: <20230523184412.204582-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230523184412.204582-1-shenwei.wang@nxp.com>

On 23-05-23 13:44:12, Shenwei Wang wrote:
> The current implementation uses the same callbacks for system PM and
> runtime PM suspend/resume without any state checking. This can cause the
> clocks to be prepared/unprepared twice, leading to kernel warning issues.
> 
> This patch resolves the double prepare/unprepare issues by separating the
> runtime PM and system PM handling.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> Reviewed-by: Frank Li <frank.li@nxp.com>
> ---
>  drivers/usb/cdns3/cdns3-imx.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/cdns3/cdns3-imx.c b/drivers/usb/cdns3/cdns3-imx.c
> index 59860d1753fd..1c6bc6036c15 100644
> --- a/drivers/usb/cdns3/cdns3-imx.c
> +++ b/drivers/usb/cdns3/cdns3-imx.c
> @@ -375,14 +375,22 @@ static inline bool cdns_imx_is_power_lost(struct cdns_imx *data)
>  		return false;
>  }
>  
> +static int __maybe_unused cdns_imx_system_suspend(struct device *dev)
> +{
> +	pm_runtime_put_sync(dev);
> +	return 0;
> +}
> +
>  static int __maybe_unused cdns_imx_system_resume(struct device *dev)
>  {
>  	struct cdns_imx *data = dev_get_drvdata(dev);
>  	int ret;
>  
> -	ret = cdns_imx_resume(dev);
> -	if (ret)
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret < 0) {
> +		dev_err(dev, "Could not get runtime PM.\n");
>  		return ret;
> +	}
>  
>  	if (cdns_imx_is_power_lost(data)) {
>  		dev_dbg(dev, "resume from power lost\n");
> @@ -405,7 +413,7 @@ static int cdns_imx_platform_suspend(struct device *dev,
>  
>  static const struct dev_pm_ops cdns_imx_pm_ops = {
>  	SET_RUNTIME_PM_OPS(cdns_imx_suspend, cdns_imx_resume, NULL)
> -	SET_SYSTEM_SLEEP_PM_OPS(cdns_imx_suspend, cdns_imx_system_resume)
> +	SET_SYSTEM_SLEEP_PM_OPS(cdns_imx_system_suspend, cdns_imx_system_resume)
>  };
>  
>  static const struct of_device_id cdns_imx_of_match[] = {
> -- 
> 2.34.1
> 

Acked-by: Peter Chen <peter.chen@kernel.org>

-- 

Thanks,
Peter Chen
