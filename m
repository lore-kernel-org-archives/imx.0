Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9598C1E8353
	for <imx@lists.linux.dev>; Tue, 22 Apr 2025 16:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745338221; cv=none; b=Ne921OZZXDtt7x69PHCSXKxBwvVRLmtQ5SK2gSa3RqH6ZLDR7nmATEpPKFkd/PvxNzPv7fKYdShaKTVsyn7rg/GJAtwdAxhd8DJ7fOteJ5xKKuHZoDyQR6XJEwY6Bcw/e0k3xrtBjs1iFcN+rup7qhuPb0r7g0GjTTyt7SNG38E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745338221; c=relaxed/simple;
	bh=nJevJKzYAzfxBEgFa8pg+lNR+fuS5jiwgYumveiDxJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fmyU/fckiq/MvKVOGFzHdWc30bFF09t43t+eJPq4rOc2rLBM0WvzgsCoHTUwXQ0neMvbeVVKW6Es0uW4Mo5fqwklKJCffK9Ll6da4WQWuA85l/do75AdEsK5mw8Xy+S44xIeICc1He4Gn+Tnxa+UcvFBMr1oe0PUbG+8oE6K1js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1u7GCK-0004il-Im; Tue, 22 Apr 2025 18:10:12 +0200
Message-ID: <4c195c2a-81c6-41c8-a134-1c7813904115@pengutronix.de>
Date: Tue, 22 Apr 2025 18:10:11 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] i2c: imx: drop master prefix
To: Troy Mitchell <troymitchell988@gmail.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Yongchao Jia <jyc0019@gmail.com>
References: <20250421-i2c-imx-update-v1-0-1137f1f353d5@gmail.com>
 <20250421-i2c-imx-update-v1-2-1137f1f353d5@gmail.com>
Content-Language: en-US, de-DE, de-BE
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20250421-i2c-imx-update-v1-2-1137f1f353d5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On 4/21/25 07:36, Troy Mitchell wrote:
> In light of the recent updates to the i2c subsystem,
> drop master prefix.
> 
> Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Please use a different cover letter title for your v2, adapting the
mainline doesn't tell the reader anything about what the series is about.

Perhaps something like i2c: imx: lock guards and cleanup

Thanks,
Ahmad

> ---
>  drivers/i2c/busses/i2c-imx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index cb96a57df4a0..dd07fde79632 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1690,8 +1690,8 @@ static u32 i2c_imx_func(struct i2c_adapter *adapter)
>  }
>  
>  static const struct i2c_algorithm i2c_imx_algo = {
> -	.master_xfer = i2c_imx_xfer,
> -	.master_xfer_atomic = i2c_imx_xfer_atomic,
> +	.xfer = i2c_imx_xfer,
> +	.xfer_atomic = i2c_imx_xfer_atomic,
>  	.functionality = i2c_imx_func,
>  	.reg_slave	= i2c_imx_reg_slave,
>  	.unreg_slave	= i2c_imx_unreg_slave,
> 

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |

