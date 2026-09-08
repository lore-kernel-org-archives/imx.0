Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E5453CA6C
	for <imx@lists.linux.dev>; Tue,  8 Sep 2026 12:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788869894; cv=none; b=DF1TTDebQ3YTHdihZQ/xSAuAmKEV1oeQb2qo+glC1gbNNqHp+acmkJ6aHG2kK8/hC5quhjWTorvRarWkKv3vwW6LvmoIch9KMCaBf843mxui3jGoiVR0N18EAJzqZbBoQPvWb9o5yxVySjiEU8edPi9hCdRaAUbKFhuiOoRAHHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788869894; c=relaxed/simple;
	bh=RTKilPGKR/u0oGz3o82GUqPpw20OFeESu5T4jmRMD4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BLO5wuuHjnh3a/glfSVZa868GpNcCefixQLZDGhEbK808L4XmU4XJ6RlRpqeqbxyiC/UFTnBDnl0PAczk50g6CAk0HRywfyXWsVdDBLjaY/Up8rjHU1rqnXP28nsCJItoo+0P0ZDVISEQRUErthOnQAijxzplEr18A1q7Xi/2C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a5QMajY0; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5QMajY0"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b4afc8465eso6132446e87.2
        for <imx@lists.linux.dev>; Tue, 08 Sep 2026 05:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788869884; x=1789474684; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NW6/rTE0SPCNPcO3PxE/nF5bbyVKnXeAwSYncVUIL58=;
        b=a5QMajY0OlM5xkLBOBzpjmMkA/wSf6UpMTreqpkTzRrVjSFKACtHFJUMZkr3nBiFUf
         IKn7a8tEGedtg5LPz4NYXz1ENsyjzxm7zY/FhYPqoMM2VBVGFqWjaxsw06breNB+d/hg
         AjCWUO4fsANB5q4KRcXsNAJDXkFNxyrxfEFTtpizv9bl6DVSt8QSFDuBWP4Oexiy56fi
         FJQTmc+Wr4QvqhyhMvfjAksJHAF+KTWomVO2ePfXNttD0/8X3fAJHdpWb2XOhJSwUCqz
         kStQrpO6keCf/gtvdxfwlCp4jlVDoSFYZYfiWMe6DzrdjDuTBokobealUu5il+AVILt7
         pTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788869884; x=1789474684;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NW6/rTE0SPCNPcO3PxE/nF5bbyVKnXeAwSYncVUIL58=;
        b=Y9Fa+yMVZoM0CdRpbw4Fp57i9wyMKd1QxabBscGaAuuWIERp8BEQ+qvKRL1VHtLGxC
         H1On6R+x7Rs678gDdaD/bHW19p7fgXM7VLneKgaqCDLVGPkw6Cp53JBI2j5HrrQGD9Pc
         nHg5XzxMtGVU1pr2oUDSl4llONOhHy8qA5bu+cK4XYxYwz8pomoRpPd4XzcJujDPRtEG
         Oe/zIezKvXuvNfi3agGikawATVU12nxsNRb00MhfLdFmRvNtFWCtWuxYx1z0EwM86fvf
         VoegdskYe5Go9AlqqiV7ZNW/CCdTiDzVI5ZIvvwELN5kuUFITFhJS80uInWg0bKHJQyy
         8kCA==
X-Forwarded-Encrypted: i=1; AKwUvBymfnpmisJoaz0zMJAUzjXGDARaS1jQacrZNROk8yIV6m1qV52GlIvvnSEdryWHHDcN/wk=@lists.linux.dev
X-Gm-Message-State: AFuF++mtvEbzp+pRNKsYy+zJ0p9UElSsK1Dv+6uc22B4fgTcxwtVGrha
	thEHQsXSCCVcnEjv6I4IhxzPgjBqLThNQYJszOxg1U7eycmeMMVbYyJQ
X-Gm-Gg: AYBFou0U9uS2850dZtp3VmUdeEnYMl1ZTZO3YaLSgFuRd8zTx3OJcE1g/eyLHmTuboM
	CpeVyis5SDZWFxtha9gKm5lZy6w2Eo1OXANgueuuv0ZEh+l7wuPnusDSv48oRkGsmVHReK8mwrJ
	SP4CFoCkctGEYL4TPY1WmfKKodH33bQY0b1nmUTKTlUaiX8k9vaLvQbQUrx/ApId4BaJCkH+1Xy
	LgDsOPjPKg1oAejqW3aML98okkvgo7+2WJpwSbRK6wBNbKYcINfzy09ry32MRKBaQ0/2/feUyV3
	cmaiMEBzX9gHhKknw8nxhNmJ/qqf3nmS+/r9VOebA2pIYb2PL0GuYlI04MrX0ihrxVr2H8JSSIt
	I2TNhitdZiOKGvI/RE1UuyX3ANhmz8CIXoW1Wx4umpTj7JiVoO6uxfFENMV64Xy+WRdhuC5eYZb
	wi8viHUcQVCYlgtofAZVy86j4EsM55xherzEdoSeIw6OzG72+YAAaM0/DXWBQ5qEXjohlgZzNJx
	4Lpeg5n7rdX
X-Received: by 2002:a05:6512:159c:b0:5ae:b91d:b2ec with SMTP id 2adb3069b0e04-5b616f01b60mr4175715e87.3.1788869883842;
        Tue, 08 Sep 2026 05:18:03 -0700 (PDT)
Received: from [10.127.126.147] ([5.195.0.145])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b61669abd4sm3104468e87.5.2026.09.08.05.17.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 05:18:02 -0700 (PDT)
Message-ID: <aaf8a5ef-2abe-4269-804e-4d2dd1bc4d3e@gmail.com>
Date: Tue, 8 Sep 2026 16:17:57 +0400
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: phy-snps-eusb2: fix FSEL_48_MHZ_VAL definition
To: Xu Yang <xu.yang_2@oss.nxp.com>, vkoul@kernel.org,
 neil.armstrong@linaro.org, mani@kernel.org, dmitry.baryshkov@oss.qualcomm.com
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20260908085953.3315953-1-xu.yang_2@oss.nxp.com>
From: ivaylo <ivo.ivanov.ivanov1@gmail.com>
Content-Language: en-US
In-Reply-To: <20260908085953.3315953-1-xu.yang_2@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8.09.26 12:59, Xu Yang wrote:
> From: Xu Yang <xu.yang_2@nxp.com>
>
> According to Synopsys eUSB2 PHY Databook, FSEL_48_MHZ_VAL should be 0x6
> for supported 48 MHz reference clock.

I don't see this as a justified change. Samsung's implementation of eUSB2
differs from the generic Synopsys interface, as is visible from the 
differences
between QCOM's implementation and Samsung's.

 From what I see for exynos2200, the FSEL value is 0x2 for both 24 MHz and
48 MHz. The differentiating part is that the upper PLL divider is 0x0 
for 24 MHz
and 0x1 for 48 MHz. The current programming was taken from the samsung
vendor kernel driver, which is a reliable-ish reference for the 
differences in register
interface implementation when we have no other public resource like a 
manual.

..now that I look into it though, the 11_8 value should probably be 
field_prep'd
instead of just directly passed as an argument of 
snps_eusb2_hsphy_write_mask(),
because right now it's essentially 0x1 & 0xf00 = 0? I haven't tested 
this path on
my hardware, so it might prove to be a regression in the future?
So:
snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_CFG_PLLCFG1, 
EXYNOS_PHY_CFG_PLL_FB_DIV_11_8_MASK,
FIELD_PREP(EXYNOS_PHY_CFG_PLL_FB_DIV_11_8_MASK, config->div_11_8_val));

For this patch though, unless this change is tested on real hardware and 
backed up
by a technical reference manual for this particular implementation, 
CC-ing the
change to stable is unreasonable.

Best regards,
Ivaylo Ivanov

>
> Fixes: c4098f3e6134 ("phy: phy-snps-eusb2: add support for exynos2200")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>   drivers/phy/phy-snps-eusb2.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
> index af4fa17ac6cb..3cb18d6ebc1d 100644
> --- a/drivers/phy/phy-snps-eusb2.c
> +++ b/drivers/phy/phy-snps-eusb2.c
> @@ -21,7 +21,7 @@
>   #define FSEL_20_MHZ_VAL			(0x1)
>   #define FSEL_24_MHZ_VAL			(0x2)
>   #define FSEL_26_MHZ_VAL			(0x3)
> -#define FSEL_48_MHZ_VAL			(0x2)
> +#define FSEL_48_MHZ_VAL			(0x6)
>   
>   #define EXYNOS_USB_PHY_CFG_PLLCFG0	(0x8)
>   #define PHY_CFG_PLL_FB_DIV_19_8_MASK	GENMASK(19, 8)

