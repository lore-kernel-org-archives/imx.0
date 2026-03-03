Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5DB42F542
	for <imx@lists.linux.dev>; Tue,  3 Mar 2026 14:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772549929; cv=none; b=dRg6heTxQiuSaBAOccf07AVWwFc8IEuRE0eR2+BaJtlz6Pkup6phfoNgIwgT8akY5zcJqSeCCxfK2k/eWb3PWr8EEctr4YTZrpigf3jA+BU72fixvoREaxCONwyK7lCurr5JxdjmWhlzmotkW+ZSBJqRn6mMbUBqKXk3LBBmnTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772549929; c=relaxed/simple;
	bh=oGjc1yjeiIqz4fk/uBDQWtGhcY0iItbRMgLP4C00KAw=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=qEDK81W+R7TyUDpfPDMo9sGLh3Bl83fGjX2Cvg/gwBASkV8ueJA5S7+2QN4hTpSs4L9aMMh7jNBwqQGdJFRMWNwPqs8VIObXdwGFaEqvHAZuCQZoBpU83ZnwdUSsobgFsFGVlH1bGizwzK3b5vrESuLizINCCVXWg5xHhGo5zIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/FSgjs0; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/FSgjs0"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38709888abeso27132241fa.1
        for <imx@lists.linux.dev>; Tue, 03 Mar 2026 06:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772549924; x=1773154724; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGjc1yjeiIqz4fk/uBDQWtGhcY0iItbRMgLP4C00KAw=;
        b=H/FSgjs0GrURwItF84T6N/PPaZ1PSixdYmOq60R+mczmQaokdn6cGX8VcFQWvH2pxz
         mTt36Plrla/UO7KKsbao5W1vB7iLMCoFoL2YkwpYijEcG9PI9ooq4wfv5tDLXtrzW2qd
         5qaF22N8A+k6TW793bv9PAffMWfQzU6Q34e21se3brNSY5l1Rbh8ne42Um5WQtbVipj8
         eH0FcXB+GcCg/mEnwMOiocaLbcrTCpnJ0+3wKcxpxYSBSokEASaj1Tx1sGs+1qxpIVgm
         T566g2bm/dzjLL2SgcA6T4ukeHcFLPUAHg0GL/CQja7eqvOZjM3xrzkLwBYsv+1+zv86
         4YqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772549924; x=1773154724;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oGjc1yjeiIqz4fk/uBDQWtGhcY0iItbRMgLP4C00KAw=;
        b=m2DBwQ8q+RG8XMeYvxiOaA8NuhLtCVzHM1TgfiqyZDrLUDeIEBlNwNs+Od9QfeuG2h
         PwsRm47nxolb8k+GgoZ2sXWaANeuBIgtURnH8mryqvVd3Nt+cSCldPNriDHbdTzqJQ8I
         4VMRadpTaFJaTPhujLelds2A+ivO3Rwqnj3x99HAH3kin1+kQgZVRxZZ6GH6v42FsZiF
         KXLTBsCkZzDbWr0TgyFyZUpPYQumzDezscZvbDJkR0B1+AlqWblmk+88mtuH8hwzD158
         y9WHzy9U/5D4mNN8WJ7OFH+hV+gqsMTv+v8vv29IWQzMz9wDtOJfgX56bD7q9pe1B+xH
         n/Jg==
X-Forwarded-Encrypted: i=1; AJvYcCWSdIo/A8IEBNgMOXuKbJ8eHnMDBESNqbh4BQbjSu6Ed5QlMX5Tc0MR/x+4J1KoRZXD0S8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwqKGzQiUR2c0Job6B3TTBQubxMpX1+2tcZ6N/FBBREPu5jM1tT
	ytHm4XNTgCitArBSDqo4D/tUyPSDXrJUldy2e1rL9o1a4bfIj49YwOnQ
X-Gm-Gg: ATEYQzyxM51WUhZj+K0eUKXC9LdffudQsDVYIk3rz46+xFawcPYDfKIWFhA6xdD/HUu
	zuMGEsX4TPQT6//pJNxG45nh4qw6FWmGf9FMTJtTyffHDX2J4ne2xh8wkrTiQDXn1cHR197eFsV
	KendKwhS00lusJT3k1xwirmE0fwhdbKh1ui+/70/icbR3maLmvUwFVZcxAyJ2MW6SbprnJpRorF
	IHJnqHO7jotITw8OL/WuV4F2d9QKdfiPhtRwmct1ZgfAEJ7/UP4IZu55FI6XPkgCLTIuf8yhCJ4
	ck9Mii+TDtVedRV/jNYz5nRfftbw21FBROPUt5Ab8wPGckZoJiMcOyJiCCTLqwZP51h7qQSrfw2
	xtGDh1YlEFy+qsxNFWINTVzRhf+vGCrurvYAQ+B84pZ32wt46hkP8/+kaBFjVhgACjA4ASRlR5Z
	mBWQzUs93znyuWcQl0b3w9tMH82B2P6ihIKoDznovT39aDWht8xqXXzsQXwvECnAYR5n9Vj113g
	cexfX4MpjAXWzKFYVybnlKwo8XUdsfwGsqh2DvR0PSgvdA=
X-Received: by 2002:a2e:80cf:0:b0:37b:aaf7:f022 with SMTP id 38308e7fff4ca-389ff3644bemr93473051fa.35.1772549923580;
        Tue, 03 Mar 2026 06:58:43 -0800 (PST)
Received: from smtpclient.apple (2001-14ba-437-c00-1991-9ef0-d3f1-621a.rev.dnainternet.fi. [2001:14ba:437:c00:1991:9ef0:d3f1:621a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a124d7fd31sm359172e87.68.2026.03.03.06.58.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Mar 2026 06:58:43 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.400.21\))
Subject: Re: [PATCH v5 03/28] of: dynamic: Fix overlayed devices not probing
 because of fw_devlink
From: Kalle Niemi <kaleposti@gmail.com>
In-Reply-To: <20260227135428.783983-4-herve.codina@bootlin.com>
Date: Tue, 3 Mar 2026 16:58:30 +0200
Cc: Andrew Lunn <andrew@lunn.ch>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Peter Rosin <peda@axentia.se>,
 Arnd Bergmann <arnd@arndb.de>,
 Saravana Kannan <saravanak@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Linus Walleij <linusw@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Mark Brown <broonie@kernel.org>,
 Len Brown <lenb@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>,
 Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Wolfram Sang <wsa@kernel.org>,
 linux-kernel@vger.kernel.org,
 driver-core@lists.linux.dev,
 imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org,
 linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-pci@vger.kernel.org,
 linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com,
 linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org,
 linux-spi@vger.kernel.org,
 linux-acpi@vger.kernel.org,
 linux-cxl@vger.kernel.org,
 Allan Nielsen <allan.nielsen@microchip.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Steen Hegelund <steen.hegelund@microchip.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Saravana Kannan <saravanak@google.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E7575FC9-7D0D-43E8-A477-4DEE79101C13@gmail.com>
References: <20260227135428.783983-1-herve.codina@bootlin.com>
 <20260227135428.783983-4-herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>
X-Mailer: Apple Mail (2.3864.400.21)

On 27. Feb 2026, at 15.54, Herve Codina <herve.codina@bootlin.com> =
wrote:
>=20
> From: Saravana Kannan <saravanak@google.com>
>=20
> When an overlay is applied, if the target device has already probed
> successfully and bound to a device, then some of the fw_devlink logic
> that ran when the device was probed needs to be rerun. This allows =
newly
> created dangling consumers of the overlayed device tree nodes to be
> moved to become consumers of the target device.
>=20
> Fixes: 1a50d9403fb9 ("treewide: Fix probing of devices in DT =
overlays")
> Reported-by: Herve Codina <herve.codina@bootlin.com>
> Closes: =
https://lore.kernel.org/lkml/CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8x6=3D9F9r=
Z+-KzjOg@mail.gmail.com/
> Closes: =
https://lore.kernel.org/all/20240221095137.616d2aaa@bootlin.com/
> Closes: =
https://lore.kernel.org/lkml/20240312151835.29ef62a0@bootlin.com/
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Link: =
https://lore.kernel.org/lkml/20240411235623.1260061-3-saravanak@google.com=
/
> [Herve: Rebase on top of recent kernel and use =
get_device_from_fwnode()]
> [Herve: Add the call to driver_deferred_probe_trigger()]
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
>=20

Hello Herv=C3=A9,

Tested this patch series with BeagleBone Black and all tests pass. =
bd718x7 driver probes.

Tested-by: Kalle Niemi <kaleposti@gmail.com>

BR
Kalle=
