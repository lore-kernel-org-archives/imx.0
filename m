Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6D432AAA7
	for <imx@lists.linux.dev>; Mon, 13 Apr 2026 13:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776087977; cv=none; b=CSQ8wD+qb67/GIM7kqIQb+zq6SOVnxcf+l3SrxJyspH9aFsGymwds+aOctcKa1qomdSZi3Vlj79x2mkEjR3HOv0tFheNMHOX2RugAUeqbVhxO0xsyNolroEJ906C+JTjIGs7E+rZpRp8T2XhmJ0zg2j7LDCYKo6eBUWEzjmb1qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776087977; c=relaxed/simple;
	bh=1JnCx6HhOINoPWX+2cEjuRhzL5gOmNZQ9ID98zwzjh0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BGWon8BDXrD7jM5xY0Pg/ismXviag0idUqR1RLJR7plqw2oFg9hiqcDWsGn5+Ykn8ic9l9ix2IGrU4pw9Ef+bJa+0zt8kf2vaBhnr+U7uvSCINEVx6xptOH9NuaoNHWoyo0Dkc15YeW/7ilk0c/VDJxfwfhn/CTdy/rizVxWxOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wCHcB-0001bv-VY; Mon, 13 Apr 2026 15:46:11 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wCHcA-005BIh-2P;
	Mon, 13 Apr 2026 15:46:10 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wCHcA-00000000DAF-2j4e;
	Mon, 13 Apr 2026 15:46:10 +0200
Message-ID: <99fdddde59e1b0fe13d5014182b1c97de4fbec86.camel@pengutronix.de>
Subject: Re: [PATCH] drm: mxsfb: lcdif: enforce 64-byte pitch alignment for
 scanout
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Advait Dhamorikar <advaitd@mechasystems.com>, marex@denx.de
Cc: simona@ffwll.ch, imx@lists.linux.dev, festevam@gmail.com, 
	kernel@pengutronix.de, dri-devel@lists.freedesktop.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, maarten.lankhorst@linux.intel.com, 
	linux-kernel@vger.kernel.org, mripard@kernel.org, stefan@agner.ch, 
	tzimmermann@suse.de, airlied@gmail.com, linux-arm-kernel@lists.infradead.org
Date: Mon, 13 Apr 2026 15:46:10 +0200
In-Reply-To: <20260413114456.173485-1-advaitd@mechasystems.com>
References: <20260413114456.173485-1-advaitd@mechasystems.com>
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

Hi,

On Mo, 2026-04-13 at 17:14 +0530, Advait Dhamorikar wrote:
> The LCDIF controller expects framebuffer pitch to be aligned to a
> 64 byte boundary for reliable scanout.
>
> While byte-granular pitches are
> supported by the interface, the i.MX8MP reference manual
> recommends 64-byte alignment for optimal operation.
>
> Corrupted output was observed with XR24 framebuffers where a pitch of
> 4320 bytes caused visible corruption and choppy display, while an aligned
> pitch of 4352 bytes worked correctly.

This happens to be divisible by 256, which is is the burst size
currently set in the undocumented CTRLDESCL0_3 register fields,
according to the comment in lcdif_set_mode().

I wonder if setting 4320 bytes stride works if you reduce the burst
size, for example by reverting commit 2215cb3be5c2 ("drm: lcdif: change
burst size to 256B") to test.

If that is the case, it might be better to allow unaligned pitches but
configure the burst size depending on pitch alignment.

regards
Philipp
