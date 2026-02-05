Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3803A641C
	for <imx@lists.linux.dev>; Thu,  5 Feb 2026 10:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770289045; cv=pass; b=KQ1Ays77KXB7vwoj7in0yp7UB9QO2kvoLgabqS+4So8Po14V3Hhu/pgdU9MMrEYIgu0VOExRXECHr1QGYfM99kswwbRRXrpm0tlBlTiCF0ENFHfRTROAZxrLwlfggt0dGGvD2p6QeBGNfWjXyxUeShcOO0SWfNuDbuQGoEtKvag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770289045; c=relaxed/simple;
	bh=zxHjp/AfzcPTWsBZcOJW1GYjfCe/ewvij7lQ92qSCA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AFCX651gGmo2qRNXsbVRvVKzCMGWXG+Skde5ANbbyxrVkIzPHDAgryPe21mAfqvU7eJ2xIUL/QjrlkF/cSrTIBV53zPEMk8SbQ8PYnwx7tlTA4qsoNlIjuI4S3Eb6+N2WEpjNXb82QRnufe4F0A4/ggHFMR53GhkQllIVu8LOdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QWT4KZqL; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QWT4KZqL"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59de0b7c28aso960781e87.1
        for <imx@lists.linux.dev>; Thu, 05 Feb 2026 02:57:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770289043; cv=none;
        d=google.com; s=arc-20240605;
        b=BvmnTHmUmtMBH91Robhgb5ppXx1uykkbxs3Rmr9cYFxrRT9azu+W8QbS51X8mrBx+4
         rc+24wp20zizfXnY8mRlOrKSCqc8BLKBQt7xTZTDxhdRfmWP7SwpRnSDEvA2TgA/szup
         Mdg4fx9QbseXt1O71P0UGIc3HRiWjApqiOArw1njnowpr8XQNMPy+QBtTekI6eRB4fMg
         AO+e4GnIwETWbwcygK8y7gGNCTkmr+HNHFT8bTu7J/ovLgsDeGjGK8fk6WFc8BxIlxUW
         ibf3+lqbIraUBhgZi75dy48KSSImL0OgT+ohcAGGpEBWM+51jWNnxwn4lN6wxyOhKx0g
         wLsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UbQJDXfJQp3l0owu271/9ErzB2CssEZ2WkwBrKRmRCk=;
        fh=8+K8+FWy5vW8uvuguDAgx9tPRNXy/3NdPIXhPXZYDbw=;
        b=c3mbPU67mJbwnCHCys22SgjUjs7U7QievagDcb1VYNDUsHaVNgzJAHkE7w9ivE01+h
         Floj3JyY9ullw/0eq9bbyT36t410Ho9wF5kGgI/1UPZiY3/ZvWaG0c1mRzvdJIkUUnlX
         9126Xb3sEBzQfF34CeAr6Fbu/0UcgI8VmzbL+2PG6wU76vUgZdkVzX63TmPV+ifxgk5d
         rG3/VRNwMbHdY6QI2D0uMcryqLVFhz0f00BVnQpNXL7k8TuIB6shCyIr90TRHh56Zb/G
         VZZYQ1afV5DN1qCsr4uR7BJdjzY/jzqB63nFF1DilOEN5c6dOr2N+X/3EeakPE9346DE
         C0cQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770289043; x=1770893843; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UbQJDXfJQp3l0owu271/9ErzB2CssEZ2WkwBrKRmRCk=;
        b=QWT4KZqL3V3KX4sQwzJuQyulG+Z0jYBvNNDBGeVrMJ2MsTWgK8QqTbOBcI/+ATlZWH
         rZvgXvO357R5NFUu5kaCwru1hEbXXCVptOqw/8hJb+G9Gnh/hsrkXSFC18K5vtxqdCzr
         xR+rW/QL44y24yWFjeHkCYX/Yd71iIjfGoBDJqXzXLdWXGBzhG+dctQwiOFpqdulwAP6
         MlHXri0GevD94Wbgc+kAqQxncbRa3tCosdJpLPRqF5IAIG+jLZXaw9MA1JSZw96fmGM+
         Lr1wU65DX2yKlKMDOztVpPPA9GSUZ7x4xTM3tivJ3LKdpD431UlhAHD6ka/MFNKcpbS0
         26gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770289043; x=1770893843;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UbQJDXfJQp3l0owu271/9ErzB2CssEZ2WkwBrKRmRCk=;
        b=UugUESGgJJb5IWVaypx/svpR2/aKN9xuTOT2+sa63/SUvaxb+YdBY94dRcuviL2pVR
         KQJnukLeQX0Nr1MOiZecIe2HjRZfrxO/i+aWChwyN1jllsPteskdCcpwy6PptgRdfWAJ
         5b2oLgJRAiDUnwMWoyrlQX4YWVbyJ2xpi21d0F340RG4HgVFuChfhM/Pa9mZlmAniK0L
         U628JtuY18myBm7wnL5Fu2YrIUpZtdMZhHqIS3PK/9Dw3y5zRZw4utCkJrq74uM2LImU
         EpvZgI2oRLnvxHJhHrD8hafZRJkqB5sL+EsSIeO6uf5WBTE6YR+WL5JiPRAUs0kraumx
         OW6A==
X-Forwarded-Encrypted: i=1; AJvYcCVVPENUr9B40WSu1Vh/GaN2cD+z05m/2SaVD4uHFNfYVXIHwA49So/wfGjDMjr2GXF6Cgc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzKrgAS0gpO1kj9joV2w+bmSWfNwQGbrALcsYf+VoGsya85+ZMm
	qpPLutSZOrcOyZJzpw+JZ+n9CUu64mSTxzzL+Riyyhox9lN//fuiE6wSg/3JT7cf4mT6zQZsGLF
	XB9MyiGUf5be9p5vyUSeHwttt2+QltSjf4xUtUZl24w==
X-Gm-Gg: AZuq6aLP/eI0+jVzmJX4Xq9Kg4Nl68anmgBjXbi9EVsGZEfW7Bsx0q33GUVehkbEQCp
	f/XDBlTkyFS/I6CPBHLXJtxv8oConvhlRxugjfshxE5BYdiALtxZC06CMlQTnKDzuaRZJRpPiB6
	03aNQzP5mqh235QzpOw6K0Nk43p4ktUfAFS9GApjWxvph3GOZlKr+PefB+BkOL6a1K4tjuoIf/k
	EtWqrOQMDAv/UUdjVz6mjsXV7AQvFYVazforwGmiUJ2+kUyiilF90SskvmK/ewSWiQcvgWX
X-Received: by 2002:ac2:5691:0:b0:59e:4095:8ac4 with SMTP id
 2adb3069b0e04-59e40958afdmr326028e87.9.1770289042830; Thu, 05 Feb 2026
 02:57:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260204111142.2147646-1-xu.yang_2@nxp.com> <20260204111142.2147646-2-xu.yang_2@nxp.com>
In-Reply-To: <20260204111142.2147646-2-xu.yang_2@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 5 Feb 2026 11:56:46 +0100
X-Gm-Features: AZwV_Qh83Z_dpPdJhPeihOR5dVWzbbZZkHZdMTDNgM3o1uPYj_8fR3Ht0j6JmE0
Message-ID: <CAPDyKFpzygoVuDNV1fYN+zfzFHfoXzJCddydNfRvUN9KuxSX5w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pmdomain: imx8mp-blk-ctrl: keep usb phy power
 domain on for wakeup
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, peng.fan@nxp.com, jun.li@nxp.com, 
	rafael.j.wysocki@intel.com, a.fatoum@pengutronix.de, ping.bai@nxp.com, 
	shawnguo@kernel.org, l.stach@pengutronix.de, linux-pm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Feb 2026 at 12:10, Xu Yang <xu.yang_2@nxp.com> wrote:
>
> USB remote wakeup need its PHY on, so add USB PHY power domain on active
> flag.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Applied for fixes and by amending the commit message a little bit to
make it clearer, thanks!

I also added a fixes/stable tag, the same that we used for patch 1.

Kind regards
Uffe


>
> ---
> Changes in v2:
>  - add flag to block control related power domain
> ---
>  drivers/pmdomain/imx/imx8mp-blk-ctrl.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> index 56bbfee8668d..8fc79f9723f0 100644
> --- a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> @@ -53,6 +53,7 @@ struct imx8mp_blk_ctrl_domain_data {
>         const char * const *path_names;
>         int num_paths;
>         const char *gpc_name;
> +       const unsigned int flags;
>  };
>
>  #define DOMAIN_MAX_CLKS 3
> @@ -265,10 +266,12 @@ static const struct imx8mp_blk_ctrl_domain_data imx8mp_hsio_domain_data[] = {
>         [IMX8MP_HSIOBLK_PD_USB_PHY1] = {
>                 .name = "hsioblk-usb-phy1",
>                 .gpc_name = "usb-phy1",
> +               .flags = GENPD_FLAG_ACTIVE_WAKEUP,
>         },
>         [IMX8MP_HSIOBLK_PD_USB_PHY2] = {
>                 .name = "hsioblk-usb-phy2",
>                 .gpc_name = "usb-phy2",
> +               .flags = GENPD_FLAG_ACTIVE_WAKEUP,
>         },
>         [IMX8MP_HSIOBLK_PD_PCIE] = {
>                 .name = "hsioblk-pcie",
> @@ -724,6 +727,7 @@ static int imx8mp_blk_ctrl_probe(struct platform_device *pdev)
>                 domain->genpd.name = data->name;
>                 domain->genpd.power_on = imx8mp_blk_ctrl_power_on;
>                 domain->genpd.power_off = imx8mp_blk_ctrl_power_off;
> +               domain->genpd.flags = data->flags;
>                 domain->bc = bc;
>                 domain->id = i;
>
> --
> 2.34.1
>
