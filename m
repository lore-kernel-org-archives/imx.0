Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D7F27B347
	for <imx@lists.linux.dev>; Mon,  2 Feb 2026 08:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770019867; cv=none; b=ncQT9ZPFyUJZsZd1nAZaZrW2TcaVkncKc5CGP9QZxxgeokRcEdLV4seZActqYsXQx7bO6rIww+TVvhlbsQ5ik92onPzPGDlZhANN/Pc5iwpp0A95Y9LZF2eUEF53Z0v2uTaKfKbS5LDI1FO9TCt6q6B0z0RH7JGJIQqaeTKXP9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770019867; c=relaxed/simple;
	bh=/MDeGfya9pW8oGspZAw2DxTtP3YW5Oyd4vEtsqVOrMc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oxW0/5awBU6DLamMvlOVvgZdGVcaA5wvOgic6fpYR+KL6Rvkhykr+Hdl7CENViMkG5PSgW612YuEVHsCKFs7c1q31/PA0kcXuurqnzEIZT5TfLJZMozMOx4/Rd4dqzb6YCxXsUERrqyM56zo/JP5WtzJNaMW1JunDoCP1+C2n3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vmp1J-0005ow-Ij; Mon, 02 Feb 2026 09:10:53 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vmp1J-003hXY-1Q;
	Mon, 02 Feb 2026 09:10:52 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vmp1I-000000003dD-2xXL;
	Mon, 02 Feb 2026 09:10:52 +0100
Message-ID: <87acb1716a13ebf03029ff7fe5a3eb94969b424b.camel@pengutronix.de>
Subject: Re: [PATCH] gpu: ipu-v3: clean up kernel-doc warnings
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard	
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, imx@lists.linux.dev,
 	linux-arm-kernel@lists.infradead.org
Date: Mon, 02 Feb 2026 09:10:52 +0100
In-Reply-To: <20260202005559.369861-1-rdunlap@infradead.org>
References: <20260202005559.369861-1-rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
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

On So, 2026-02-01 at 16:55 -0800, Randy Dunlap wrote:
> Correct all kernel-doc warnings:
> - fix a typedef kernel-doc comment
> - mark a list_head as private
> - use Returns: for function return values
>=20
> Warning: include/video/imx-ipu-image-convert.h:31 struct member 'list' no=
t described in 'ipu_image_convert_run'
> Warning: include/video/imx-ipu-image-convert.h:40 function parameter 'ipu=
_image_convert_cb_t' not described in 'void'
> Warning: include/video/imx-ipu-image-convert.h:40 expecting prototype for=
 ipu_image_convert_cb_t(). Prototype was for void() instead
> Warning: include/video/imx-ipu-image-convert.h:66 No description found fo=
r return value of 'ipu_image_convert_verify'
> Warning: include/video/imx-ipu-image-convert.h:90 No description found fo=
r return value of 'ipu_image_convert_prepare'
> Warning: include/video/imx-ipu-image-convert.h:125 No description found f=
or return value of 'ipu_image_convert_queue'
> Warning: include/video/imx-ipu-image-convert.h:163 No description found f=
or return value of 'ipu_image_convert'
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Thank you,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
