Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBCA19CC29
	for <imx@lists.linux.dev>; Wed,  9 Oct 2024 14:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728483735; cv=none; b=W/FiHgTj67KXhVdxDt1fq+6u+fx8olIF4OvZ0aEOI6EzDw0hdpSIoGhn1XPTu9B4Cd3ixJG/iD1mYVK30+QjeXBpezSsc8twg7Dv7C4LNpowztHDUcWlrsVtIdwZ/KwVOYEsQZDXeitYXUNpqIyVLaW+93fsutS+WsGm/laEPs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728483735; c=relaxed/simple;
	bh=MMGjkw7s/Ds1xI1p8hHtZ/T078t1M4/TDrawtYsxj80=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HdatTynm7mXKHwb+wZkVqtYzOvOU7J+WQbAJwLID7pHrYUAH5/PerRFxQJJNPO59GsYmlY1lDTu2417M4cBDLcIkEbUo1aau7zIVYUQIDeyGrOKUqzbkSb9b+ry+IZHGHMo5rxXI1ZNUvQLcqO1QqlEUfTnZVM7NzPTKs3+TamQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1syXZm-0004xv-6L; Wed, 09 Oct 2024 16:22:06 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1syXZl-000cgH-8y; Wed, 09 Oct 2024 16:22:05 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1syXZl-000CMM-0g;
	Wed, 09 Oct 2024 16:22:05 +0200
Message-ID: <d371a079ac984103f0a720e25f2e47b4206348cd.camel@pengutronix.de>
Subject: Re: [PATCH] drm/imx: add forward declarations for types
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Date: Wed, 09 Oct 2024 16:22:05 +0200
In-Reply-To: <20241009140452.1981175-1-jani.nikula@intel.com>
References: <20241009140452.1981175-1-jani.nikula@intel.com>
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

On Mi, 2024-10-09 at 17:04 +0300, Jani Nikula wrote:
> The imx.h header does not forward declare the types it uses, and the
> header is not self-contained. Fix it.
>=20
> Fixes: cc3e8a216d6b ("drm/imx: add internal bridge handling display-timin=
gs DT node")
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Thank you,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
