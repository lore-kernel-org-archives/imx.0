Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA45D37A3B4
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 15:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761839198; cv=none; b=iwxDZ+Qtz7Mamp7v9CZyuAdojMWYqeWAozNPKPkbqmCVCRUcVpg3m39mxb+wf3coZlDv6nt8eqniVZFENrszT8dgL7E7fVYzK7djyKcej18A6E+qWx+USRMc8S/ssWKqHMGD3TUGizgt/czRrAUvrp1SCjvk0JDBh3Rc3liJEsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761839198; c=relaxed/simple;
	bh=NxL2ALxVm/yJ6/Guk8w3TDMgQeDRItHFZy4q6SnTs/4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Hi6I3sae18ncVnLqzC9rIN3yTtMPGfWeHDoWGcw3RJ+xX/xQmelZSSOfNxsY/OyOFvqhUnIykkYjs4/TL/ici+NVjLIJzGkLMtKWotKNKZXGdeaAHl75yzc8pbFCno2+9wWXddtaEhGd0wsFxhTkhb4svgZSp6xQNOfyhMnKG68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vEUr3-0002vp-QH; Thu, 30 Oct 2025 16:46:25 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vEUr3-006Efs-0T;
	Thu, 30 Oct 2025 16:46:25 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vEUr3-00000000D2x-0GYQ;
	Thu, 30 Oct 2025 16:46:25 +0100
Message-ID: <d03ca7d177bf3ada5ab3d08d39cf579657bc0acb.camel@pengutronix.de>
Subject: Re: [PATCH 0/4] drm/imx: drop unused module aliases
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Johan Hovold <johan@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard	
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sascha Hauer	
 <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Thu, 30 Oct 2025 16:46:24 +0100
In-Reply-To: <20250924092643.26113-1-johan@kernel.org>
References: <20250924092643.26113-1-johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
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

On Mi, 2025-09-24 at 11:26 +0200, Johan Hovold wrote:
> When fixing up a device reference leak in the tve drivers I noticed it
> had an unused platform alias. This series drops unused aliases from the
> imx drm drivers.

Thank you, applied to drm-misc-next.

regards
Philipp
