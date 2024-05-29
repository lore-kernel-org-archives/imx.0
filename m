Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616F8156F32
	for <imx@lists.linux.dev>; Wed, 29 May 2024 14:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716994787; cv=none; b=RrFhKC1YmiiaGyixA+hNSFH1S1cEYNxkkRUfa5Hw13/cu8tDS6mRj1cp7dltQE+iMhDxBIB40Zt8KlTesVGpAKnM4ExATvSjyeI9qff0qQqPNzl305neN/LXEN1673STJpQFJ0ZoFkGln7geufddHqFtJzbDQCWtsHt3riew19w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716994787; c=relaxed/simple;
	bh=YAT9dsM9pI7gBcsu+sKqreMBuuMomHR5Qsy/PNYY3pk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LjzjoAVXURatALKZyJ3YDIV33wosN7E+tKLuI8JdqqF7HG2xmLgS843xe1Ya9QE6xjRtKCUKkdDaVvIQLa/7kdsmZ2kqNEtjvhi2w8vNdDRfvU5fTZLeMUxNUcCU1Nlf+wTKRfutykpLOt8A/ikrEVFeXX74DhTm+a0GtqOPMec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sCKm7-0003ci-JB; Wed, 29 May 2024 16:59:35 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sCKm7-003TeE-0v; Wed, 29 May 2024 16:59:35 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sCKm6-000DeG-33;
	Wed, 29 May 2024 16:59:34 +0200
Message-ID: <25c5dde93f89e6c99ef86e05df8223931ea174ed.camel@pengutronix.de>
Subject: Re: [PATCH v2 04/12] drm/imx: parallel-display: drop edid override
 support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>,  Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Date: Wed, 29 May 2024 16:59:34 +0200
In-Reply-To: <20240331-drm-imx-cleanup-v2-4-d81c1d1c1026@linaro.org>
References: <20240331-drm-imx-cleanup-v2-0-d81c1d1c1026@linaro.org>
	 <20240331-drm-imx-cleanup-v2-4-d81c1d1c1026@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On So, 2024-03-31 at 23:29 +0300, Dmitry Baryshkov wrote:
> None of the in-kernel DT files ever used edid override with the
> fsl-imx-drm driver. In case the EDID needs to be specified manually, DRM
> core allows one to either override it via the debugfs or to load it via
> request_firmware by using DRM_LOAD_EDID_FIRMWARE. In all other cases
> EDID and/or modes are to be provided as a part of the panel driver.
>=20
> Drop support for the edid property.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
