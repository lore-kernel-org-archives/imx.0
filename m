Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF90371CFF
	for <imx@lists.linux.dev>; Mon, 16 Mar 2026 09:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773655040; cv=none; b=dA7NTEWWcX4kRpTlX6qBbzqcnvZTVVVCdk9o10/pdJY3rUmerMP0zdvoS8iYvZgewfMI8geI4JCOW4GhWfD5S0EzoWPmJz0ag1IpYvP8Cb+xOlNfttuCycCxGgBUh47gA9kk+l1wVL4KyGvDcE/iLbClCz+KZEiqEUiIev1pex0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773655040; c=relaxed/simple;
	bh=7brzX4WOi+5jYVLMoJofPutcuzGjrekvjwI7c1OWTA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FJNZHBoTjL3CEJC9YzXSKJZysEbr3KGVf0VMMdceGZ/3UJG4jbQWWdj7T2QjZ6fIQLSiEydWfVmRD8edYTluWxKey01FBcS98IovVCbrHXBKiYSAeJxa148frnYuSoDZF0sE4NG+xw7edX+YWG2zf8pxGcZ0hjTkgBKoBszrdGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jV1WlJxJ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jV1WlJxJ"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439b8a3f2bcso3082904f8f.3
        for <imx@lists.linux.dev>; Mon, 16 Mar 2026 02:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773655037; x=1774259837; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ORR2k9D3W/c7ahH5HJ1Wm+dpUNHSI19Jin/n96XvaOU=;
        b=jV1WlJxJvxu9VVrrlTgYTViMs2F3rpkNtVoAhFIsJLqCqssqSDzQGE8IXZ8+GLUYWg
         71yAmDTsf5lRuGvz+ccw8RvOwi3aX2s2EeV3RmgPZl4M901B4o45lsSU6S0nLlHsXBGW
         Ut9h049FgzfsansA0pLJW6K+WyDiz491dndkBghkwyAi1Oj1UD00AGBsoRzRS1NTS5Rp
         kETN3kbsjOfiaiwxnAnHekSC7n+0fxqHcgfq18mohn17HFliQxM5+V52CPRlA8zlWfTD
         5TV1G7gTDVgYU9paKCI3e8jmCd+VHFY/JPVLBrIfVcQu40NR9C4b1G5ATn5XakrfU+9H
         fPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773655037; x=1774259837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ORR2k9D3W/c7ahH5HJ1Wm+dpUNHSI19Jin/n96XvaOU=;
        b=axGEogLIxSGDMKX+eQNEaWc3xoeR/ODTuiEqolzkw/4NrRu+HPG5C5zuxv5iGhfqDv
         bLJU+RY7dsqmvC2tTOz3sKa/F+r8c+/lFaD7110fHLKN7RafZm6kmzbVPFtphYym3++G
         ceiQJEYJQuoI7DBwgJN6U4Zwavl9UYdno0hTt1E/A+6dZE+BMsiFrngS06EGDZEoeMk6
         mv5pnJBdvfjvCyLayAsgr7RdGyrXlT7iyzC0q0bFgXYlJm3jsRtvf8OXcPFpAncVYD3U
         cxFYD76g4Dn9nlRgMswavY8IQUqBfU0v0zqX/luHhp2dXc+nFrEm3pSfjfKbinIJJuCn
         5XtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBOSyseUd4+ZW5ALQVKG9OUdVI+/xBXy/eEm6j5NJKCBuXbAz4bN2aN4JJXdcD25XLn1I=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNd8Cj/Qyz7H7IuT7fE5JoZj6ERaxk1rDxSrqe7NuGo7mjm4ND
	O54K86lqU6QuDAsyHpBrqPKMLfwqdwBSPFEuV0k1Yb6vj0uyGqZlWvZ29aI2AgQ7K5o=
X-Gm-Gg: ATEYQzzqAzJRzJvHqzBL0AEEV98gPla6w82nYE8Vvaw/uJig0tqeazVtSSsbDw13cEj
	jfIp6v1qkXbZqdvA6iD1qgJR2H8o7GHXXuV9ICePWlFJfX5MO2Clk4Xz+PNf/4OaxR1wCJHI/oC
	IeaIpIoFpREOkJA8ccai2svPTBDXXMsEtINiWtNq7TQ+mNItwwzM1E4ib88gYkOCnv7avbDcr1X
	brMb5xdqcVpgReavZI4wGt7pAzyjOZebRqYmOt7OcYixpgU84mHaAnAjZTVsFRCM8eLGLQC9/uq
	yD2uhhRQpupWfvKXi8d8nahWhAPvvmkOVp9D3OMZml61kKG31JUTRuPanfMMy+0JQRknVeIMN1V
	1963WKIN91orui+ChFFLPbQL12OfEWz9YswJnM7hW3wR3Hh57vAZ1TxadLASDuVdDGikCZoQsmy
	FB/Ujp3SD9rz+LfCVNNDXeaUdb+Lqn
X-Received: by 2002:a5d:5d86:0:b0:439:b3a3:7239 with SMTP id ffacd0b85a97d-43a04d78189mr21771898f8f.5.1773655037253;
        Mon, 16 Mar 2026 02:57:17 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b3b0e9b99sm18531007f8f.18.2026.03.16.02.57.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 02:57:16 -0700 (PDT)
Message-ID: <dbdd4655-1c6a-42b0-a6fe-8d14db1043f0@linaro.org>
Date: Mon, 16 Mar 2026 09:57:15 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH spi-next 11/11] spi: spi-fsl-lpspi:
 fsl_lpspi_set_bitrate(): don't treat devtype_data->prescale_max == 0 as a
 special case
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 Frank Li <Frank.Li@nxp.com>, Mark Brown <broonie@kernel.org>
References: <20260316-spi-fsl-lpspi-cleanups-v1-0-1b695607702d@pengutronix.de>
 <20260316-spi-fsl-lpspi-cleanups-v1-11-1b695607702d@pengutronix.de>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260316-spi-fsl-lpspi-cleanups-v1-11-1b695607702d@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/03/2026 8:39 am, Marc Kleine-Budde wrote:
> The i.MX93 is affected by erratum ERR051608, the maximum prescaler value is
> 1 not 7 as in the original datasheet.
> 
> On unaffected SoC the maximum prescaler is 7. Commit 783bf5d09f86 ("spi:
> spi-fsl-lpspi: limit PRESCALE bit in TCR register") added struct
> fsl_lpspi_devtype_data to hold the system dependent prescale_max value.
> 
> Commit 9bbfb1ec959c ("spi: spi-fsl-lpspi: Treat prescale_max == 0 as no
> erratum") introduced the special value 0 to signal the default and
> corresponding run-time check with a conditional operator.
> 
> To simplify the code, set the prescale_max of imx7ulp_lpspi_devtype_data

The whole point of the original change was to not repeat the normal 
value for every device in the config just because one device has an 
errata. This new change is exactly the opposite of simplification IMO.

> and s32g_lpspi_devtype_data to 7 and in fsl_lpspi_set_bitrate() directly
> use the fsl_lpspi->devtype_data->prescale_max.
> 
> On ARM64 this leads to a reduction of the code of 52 bytes:
> 
> | add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-52 (-52)
> | Function                                     old     new   delta
> | fsl_lpspi_setup_transfer.isra                956     936     -20
> | $x                                          7144    7112     -32

On clang 15 this change makes it bigger by 220 bytes rather than 
smaller. I checked because I was suspicious that removing a single 
ternary could save 52 bytes, but it looks like the outcome after all the 
optimisations is just unpredictable so there isn't much point in making 
changes like this.

You also didn't say _why_ we need to save 50 bytes, or what the 
performance impact is.

> | Total: Before=19675, After=19623, chg -0.26%
> 
> This partly reverts commit 9bbfb1ec959ce95f91cfab544f705e5257be3be1.
> 
> Cc: James Clark <james.clark@linaro.org>
> Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
> ---
>   drivers/spi/spi-fsl-lpspi.c | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
> index 3a0e9726fa71..f2c7bb3bc4cc 100644
> --- a/drivers/spi/spi-fsl-lpspi.c
> +++ b/drivers/spi/spi-fsl-lpspi.c
> @@ -96,7 +96,7 @@
>   #define SR_CLEAR_MASK	GENMASK(13, 8)
>   
>   struct fsl_lpspi_devtype_data {
> -	u8 prescale_max : 3; /* 0 == no limit */
> +	u8 prescale_max : 3;
>   	bool query_hw_for_num_cs : 1;
>   };
>   
> @@ -143,8 +143,10 @@ struct fsl_lpspi_data {
>   };
>   
>   /*
> - * Devices with ERR051608 have a max TCR_PRESCALE value of 1, otherwise there is
> - * no prescale limit: https://www.nxp.com/docs/en/errata/i.MX93_1P87f.pdf
> + * Devices with ERR051608 have a max TCR_PRESCALE value of 1, otherwise use
> + * the register limit of 7.
> + *
> + * https://www.nxp.com/docs/en/errata/i.MX93_1P87f.pdf
>    */
>   static const struct fsl_lpspi_devtype_data imx93_lpspi_devtype_data = {
>   	.prescale_max = 1,
> @@ -152,10 +154,11 @@ static const struct fsl_lpspi_devtype_data imx93_lpspi_devtype_data = {
>   };
>   
>   static const struct fsl_lpspi_devtype_data imx7ulp_lpspi_devtype_data = {
> -	/* All defaults */
> +	.prescale_max = 7,
>   };
>   
>   static const struct fsl_lpspi_devtype_data s32g_lpspi_devtype_data = {
> +	.prescale_max = 7,
>   	.query_hw_for_num_cs = true,
>   };
>   
> @@ -348,7 +351,7 @@ static int fsl_lpspi_set_bitrate(struct fsl_lpspi_data *fsl_lpspi)
>   	int scldiv;
>   
>   	perclk_rate = clk_get_rate(fsl_lpspi->clk_per);
> -	prescale_max = fsl_lpspi->devtype_data->prescale_max ?: 7;
> +	prescale_max = fsl_lpspi->devtype_data->prescale_max;
>   
>   	if (!config.speed_hz) {
>   		dev_err(fsl_lpspi->dev,
> 

