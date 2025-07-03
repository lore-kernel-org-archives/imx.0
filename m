Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6792C15B2
	for <imx@lists.linux.dev>; Thu,  3 Jul 2025 08:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751530265; cv=none; b=DQ9oF0EeaCRU1C6Qgvl53w9NaLZ5jVV8p8LpuxzjGuwPbR2QPYKWNOrcwUcIhPfxNqmPf7gIk8gSGjQn/tjHQMwarAmv0IO18hmkMkY3qtXiIww/5DblEpFHeJzOZxyW4XqbAHoTpqMabfbEjNU+TWFpgGMzIX1nUNtxuLsx1Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751530265; c=relaxed/simple;
	bh=VJxDMDcvuNiGqPzWy8ueJi3tfdG9/R3VPQDmQXZ2D0A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ezj8kza5tM6bqQ/hm4ljQtEMKWzN8rVrbjCbGCUhIJ+P8/NH2dLSk9OGrfw/fiSEtbLkhF9O9gFnYXJ+wnp+g8539cqEfUisOt9ZgWcmoPjgBW8sjsnusP/5/Z/UqpxgGfIiCd4ga2Vfn/XVnabC5+iNCE/Ot7wuZI3fNaXByLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GSWLBGNi; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GSWLBGNi"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 436CD44386;
	Thu,  3 Jul 2025 08:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751530262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LAI1mLd80Uu/qyT+cT0jcdFKQzyXKg/JSwW4hvNefdw=;
	b=GSWLBGNiFskz3pPr5ysMh8m1slrvPREt+nJA5jB3928KCzs35bf7DaMYR36LU0hmj+ZrFe
	F9+odOPUcBJU3EBWmgMatI+v7VS3qWTCAUmbU0wfbiqk1cGk0ZtBucHP+YzTk/Brygtscm
	foQqGflkGwK79xENMpRHwxR/Utj3dBgU8mUgxW/OhixYGpR4Aw7cH3zK+8Ap4ry0sXwAms
	JC17SVHo+z0ed5KiUmRefW0pNYnBbfO9kWUimNasF9qSxKQ/cIkxJBvExaQLj/XSqoHJbv
	HOYtjqyBNzGSyGAQGPqEdRc+f+dwPc7oHl426XP5m+Kd1R3AepOl02VFEl83Mw==
Date: Thu, 3 Jul 2025 10:10:58 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, Derek
 Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Saravana
 Kannan <saravanak@google.com>, Bjorn Helgaas <bhelgaas@google.com>, Mark
 Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Davidlohr Bueso
 <dave@stgolabs.net>, Dave Jiang <dave.jiang@intel.com>, Alison Schofield
 <alison.schofield@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, Ira
 Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org, Allan Nielsen
 <allan.nielsen@microchip.com>, Horatiu Vultur
 <horatiu.vultur@microchip.com>, Steen Hegelund
 <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 02/28] driver core: Rename get_dev_from_fwnode()
 wrapper to get_device_from_fwnode()
Message-ID: <20250703101058.225e296f@bootlin.com>
In-Reply-To: <CAJZ5v0iaqT5VY3=UCkTGQKjE7thEPmsSqsrEw9ntWEpZ6bNR3A@mail.gmail.com>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
	<20250613134817.681832-3-herve.codina@bootlin.com>
	<CAJZ5v0iaqT5VY3=UCkTGQKjE7thEPmsSqsrEw9ntWEpZ6bNR3A@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduleejiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvhfeljedtfedtjeevffegtddutdeghfettdduhfeuhfdttdffieeuiefgvdfhvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemvgdtrgemvdekheemsgelkedtmegvgedttgemiegtgeefmegshegssgemrgegvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvkeehmegsleektdemvgegtdgtmeeitgegfeemsgehsggsmegrgedvkedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegkedprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpt
 hhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com

On Wed, 2 Jul 2025 20:17:15 +0200
"Rafael J. Wysocki" <rafael@kernel.org> wrote:

> On Fri, Jun 13, 2025 at 3:48 PM Herve Codina <herve.codina@bootlin.com> wrote:
> >
> > get_dev_from_fwnode() calls get_device() and so it acquires a reference
> > on the device returned.
> >
> > In order to be more obvious that this wrapper is a get_device() variant,
> > rename it to get_device_from_fwnode().
> >
> > Suggested-by: Mark Brown <broonie@kernel.org>
> > Link: https://lore.kernel.org/lkml/CAGETcx97QjnjVR8Z5g0ndLHpK96hLd4aYSV=iEkKPNbNOccYmA@mail.gmail.com/
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Reviewed-by: Saravana Kannan <saravanak@google.com>
> > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > ---
> >  drivers/base/core.c | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> >

...

> 
> There are patches in flight that add new users of get_dev_from_fwnode(), see
> 
> https://lore.kernel.org/linux-pm/20250701114733.636510-1-ulf.hansson@linaro.org/T/#mc45a73769821cc520c35d8eb92d4bac75412bb7c

Thanks for pointing out.

I will monitor the series you pointed out.

Once it is applied, I will update my modifications but I will probably send other
iterations in the meantime in order to move forward on the other topic without
waiting for the Ulf's series.

In my other iterations I will point the dependency in patches impacted i.e
patches 2 and 3.

Best regards,
Hervé
