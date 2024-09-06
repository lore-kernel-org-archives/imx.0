Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6DF1922FD
	for <imx@lists.linux.dev>; Fri,  6 Sep 2024 11:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725623217; cv=none; b=sNU4xk9o/NQTADNWJVHsQuQglVNb8PD9M2ZC0BxwloKkRS0F2ujndV2Yd4brSMPnM7Mh9OwmTZP7rmD1PdY31LFWBD5ULUmiWlPlzo/Sf1gWeOr0AzXYcgZeg2Ce7CyClA66nkdXgyHvsvaZ9c8uEdz9kCek/2VgwITbdwXqzbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725623217; c=relaxed/simple;
	bh=+1NIRiUVMBo8EjMzhxcpr/IDwbogu1+HnG9cOWveE5o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z9JR5W7MvUs8NRInRIAVBd+B0tbTGs3/e0wSa37pgN8cwgsmGo3nTpNVGv99Ri0C6oNFHvM9KTRjTLPy0jWugtKHyxjuiL8DpZE8hqtjkM479rMjAuvaWVmp7Ehybsiu6FT+sEwCacOwdIqBgXHG3lK8A9vi1HXO6+l5kxiqNcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1smXQL-00027c-8B; Fri, 06 Sep 2024 13:46:45 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1smXQK-005w12-69; Fri, 06 Sep 2024 13:46:44 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1smXQK-00076I-0J;
	Fri, 06 Sep 2024 13:46:44 +0200
Message-ID: <c4e1da1d2f005e22f74eb2461382fd4666dedd4f.camel@pengutronix.de>
Subject: Re: [PATCH 1/1] drm/imx: Add missing DRM_BRIDGE_CONNECTOR dependency
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Alexander Stein
	 <alexander.stein@ew.tq-group.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 dri-devel@lists.freedesktop.org,  imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Date: Fri, 06 Sep 2024 13:46:43 +0200
In-Reply-To: <CAA8EJpoz7jtjN-Dxq-6SHNiZCz2xsFFf5j4HOoFiLAq=OnHn6Q@mail.gmail.com>
References: <20240906063857.2223442-1-alexander.stein@ew.tq-group.com>
	 <CAA8EJpoz7jtjN-Dxq-6SHNiZCz2xsFFf5j4HOoFiLAq=OnHn6Q@mail.gmail.com>
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

On Fr, 2024-09-06 at 14:35 +0300, Dmitry Baryshkov wrote:
> On Fri, 6 Sept 2024 at 09:39, Alexander Stein
> <alexander.stein@ew.tq-group.com> wrote:
> >=20
> > When drm/bridge-connector was moved to DRM_DISPLAY_HELPER not all
> > users were updated. Add missing Kconfig selections.
> >=20
> > Fixes: 9da7ec9b19d8 ("drm/bridge-connector: move to DRM_DISPLAY_HELPER =
module")
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >  drivers/gpu/drm/imx/ipuv3/Kconfig | 2 ++
> >  1 file changed, 2 insertions(+)
>=20
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>=20
> I'll update it to drm-misc-next if nobody objects within a few hours

drm-misc-fixes? drm-misc-next doesn't contain 9da7ec9b19d8 yet.

regards
Philipp
