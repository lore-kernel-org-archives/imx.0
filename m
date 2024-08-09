Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713DA192B61
	for <imx@lists.linux.dev>; Fri,  9 Aug 2024 11:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723201223; cv=none; b=VfjSSIv+gkV2Tyz37vZUVuye9sc7DGkOwUtlSijiJldn5K6hrwYcspvn2axFocaoH9A1aKYGIguZ+caW2QkylpIlV/7iLAcSbJbPbyjHplw67ugaQPsowLZmEfVc9ga7zH0JQSu8eo1eQTjF3j43ANDET2fO9yMvo7Q2NKszeNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723201223; c=relaxed/simple;
	bh=kXYt4o+C1M8T7u19o1mTt8sBf4Ll0/VhcbX7xFna7NU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VSs3u0BGmFAQRn7Rc2M4CPjfpTnLUVFx4hBnIB02TpTVLlo3z6fKDNmjI8yfivnxUnEphe2+Mjord3tdqmX7jBwujaWMaJb2zm6QYni1J4FlF890lS9Lm5lAo8gVKIm0/bBIrVMHmHt1HOL4MoLd4o98CVByC0WnsyGAJIuxXEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1scNLs-00035s-Kj; Fri, 09 Aug 2024 13:00:08 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1scNLr-005eDd-VW; Fri, 09 Aug 2024 13:00:07 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1scNLr-000AQm-2p;
	Fri, 09 Aug 2024 13:00:07 +0200
Message-ID: <41c7f546ab56c90bbd963310a4fbb7f880fe8b54.camel@pengutronix.de>
Subject: Re: [PATCH v3 09/12] drm/imx: add internal bridge handling
 display-timings DT node
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
Date: Fri, 09 Aug 2024 13:00:07 +0200
In-Reply-To: <20240602-drm-imx-cleanup-v3-9-e549e2a43100@linaro.org>
References: <20240602-drm-imx-cleanup-v3-0-e549e2a43100@linaro.org>
	 <20240602-drm-imx-cleanup-v3-9-e549e2a43100@linaro.org>
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

On So, 2024-06-02 at 15:04 +0300, Dmitry Baryshkov wrote:
> i.MX DRM DT bindings allow using either a proper panel / bridge graph to
> provide information about connected panels, or just a display-timings DT
> node, describing just the timings and the flags. Add helper bridge
> driver supporting the latter usecase. It will be used by both LDB and
> parallel-display drivers.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
