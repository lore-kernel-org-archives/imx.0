Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC9E1EE03D
	for <imx@lists.linux.dev>; Fri, 14 Mar 2025 16:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741968322; cv=none; b=f0i6DULYUEoPlAuKduhHCgMtibcJi6mxU+zQqbJerEDBWdiaGotCkE5/gcWm63POegdJjq5yOtl9LRzW56BgHtQ5BnOXzwn/Uo2mhq+AjuogvYl/82S+BPMr1L1csR+zeXnzxgBoxpQ5+0nFiXBcXwrTgOoWZlAZwXBNS51wf70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741968322; c=relaxed/simple;
	bh=AlL/eilY7a6LvH7AFh4F/7NNvc/61nWc2Cn3lPejut0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UymRMMGcdrkfFE14s/jFg/hkf+uSQW4HLhjxc1KqUWWK6auk584u+Qkeim7AoUFju3MDmPxwLLGWoTE9wTKVBJ1Jdi2rpqCqwcgREKoDmP6okrEwtaZr6MVqrqmuxIXusZufqU2StbSRmRu52SY9mfs/H4ftiXDSNJQWzSPjgh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tt7X3-0003ae-7S; Fri, 14 Mar 2025 17:05:09 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tt7X2-005jEa-2G;
	Fri, 14 Mar 2025 17:05:08 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tt7X2-0009KL-21;
	Fri, 14 Mar 2025 17:05:08 +0100
Message-ID: <9bd42362c798cc3339ab9b34b32a9eb7eb4d1ba7.camel@pengutronix.de>
Subject: Re: [PATCH] reset: imx: fix incorrect module device table
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Arnd Bergmann <arnd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
	Hauer <s.hauer@pengutronix.de>, Frank Li <Frank.Li@nxp.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Pengutronix Kernel Team
	 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 14 Mar 2025 17:05:08 +0100
In-Reply-To: <20250314153541.3555813-1-arnd@kernel.org>
References: <20250314153541.3555813-1-arnd@kernel.org>
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

On Fr, 2025-03-14 at 16:35 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The ID table is for of_device_id, not platform_device_id:
>=20
> ERROR: modpost: drivers/reset/reset-imx-scu: type mismatch between imx_sc=
u_reset_ids[] and MODULE_DEVICE_TABLE(platform, ...)
>=20
> Fixes: 6b64fde5c183 ("reset: imx: Add SCU reset driver for i.MX8QXP and i=
.MX8QM")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied to reset/next, thanks!

[1/1] reset: imx: fix incorrect module device table
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3Dc361baf67200

regards
Philipp
