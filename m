Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A03191;
	Sat, 16 May 2026 19:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778959860; cv=none; b=k/GsCsZXEvvcos9h08qCjVOlT3bN7xbQ0+jVLYX1gHmAuVu3MHuCbqPKrptp17qG09Fh/RKj1NqWy39ZMXJpz5AYwyYxYASAjq+R6fzxSohXNUnpcKa4BMvuyurwWwTFzKUK8D4PQk6fZif7iFbz7sOKpPJcZFAornCBWidCDvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778959860; c=relaxed/simple;
	bh=qa4Kx8AigUFqG+escYqdRdXu8yHs7QJV/56q/8UC7UM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=guNrRhsG36SzXGAUH2idSdI8MqiTX6P3FVAghGoJW/GCBQsOR5uZLoJ3e1KguHpq/J/yHRWTGIfq+cXVA2r8nCNSt1iBqTdpU/EWxBypKW++pt7HV828MlsK33CA41GbRtyn1OKgif/I68lnjJHqa1KaOC5+0lbnFqXRGqCKDIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XYavl+Nj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XYavl+Nj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69570C19425;
	Sat, 16 May 2026 19:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778959859;
	bh=qa4Kx8AigUFqG+escYqdRdXu8yHs7QJV/56q/8UC7UM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=XYavl+NjWkcLvA3ehzo3B/xIsnzZwGWuuWZIpnHyQL46iRKRiRfFtdyNG5eJytnM9
	 DMviyVDLQ85LPm0i3ei7Qx9Jd1c8rO1O72/8C43+V1PdaMnnKeNuIF5b7x7U8qo6Qr
	 a28d6avznVmsNwEwmssGxaiW+he+DdI/5Q31WSGPHcR9dDkmKHzJStdoHAM6rdIgWi
	 QfqNK/g1uNA/8Yg5KX3xm5+UDU3JQTeYnj5oWs2//6Nu64rLVJ85IdNlhFLpBHmIyL
	 mim4XEaamS9ASSGabwokexVibx5G3w3rMrbvSTzdwsh1bG69fqE8e5AGxfhtljGeup
	 dVY2zJMdHF5UA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 15/22] drm: bridge: dw_hdmi: Declare bridge CEC
 notifier support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, Frank.Li@kernel.org, imx@lists.linux.dev, linux-sunxi@lists.linux.dev
In-Reply-To: <20260516183838.2024991-16-jonas@kwiboo.se>
References: <20260516183838.2024991-16-jonas@kwiboo.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 May 2026 19:30:58 +0000
Message-Id: <20260516193059.69570C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The driver unconditionally advertises CEC notifier support even =
if the CEC platform device fails to register.
--

commit 28a90bcf8d7861ee7124899b88745cc0c892f390
Author: Jonas Karlman <jonas@kwiboo.se>

drm: bridge: dw_hdmi: Declare bridge CEC notifier support

This commit updates the bridge to advertise CEC notifier support,
instructing the bridge connector to use generic CEC notifier helpers.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/=
bridge/synopsys/dw-hdmi.c
> index 3649ccf8d994e..1402b3963ae12 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -3537,6 +3537,9 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_devic=
e *pdev,
>  		pdevinfo.dma_mask =3D 0;
> =20
>  		hdmi->cec =3D platform_device_register_full(&pdevinfo);
> +
> +		hdmi->bridge.ops |=3D DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER;
> +		hdmi->bridge.hdmi_cec_dev =3D hdmi->dev;

If platform_device_register_full() fails and returns an error pointer,
should we still advertise CEC notifier support?

It looks like DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER and hdmi_cec_dev are set
unconditionally here. If the CEC device registration fails, could this
cause the DRM bridge connector initialization to unnecessarily allocate
and register a CEC notifier for a hardware adapter that did not probe?

>  	}
> =20
>  	drm_bridge_add(&hdmi->bridge);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516183838.2024=
991-1-jonas@kwiboo.se?part=3D15
