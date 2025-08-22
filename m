Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCD8223DE7
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 03:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755831967; cv=none; b=Cf/xHCr95vvcoPJMynv4ZGkJlbv1VqJWkcza86kk7r1OikpTIgWKc4p+tiEHHHGvc7cvVjQqig22xlc5f7RZVpieyZtWZb2h+wUvS0REwfjU/LFQNIaB7sKSjhSZKB3PbSP78MwKQcw+WzvdvOdbfv7dyA/DNSXOP/3f98HPIHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755831967; c=relaxed/simple;
	bh=TXwLsMZ2s0ltb5fnspir6s1oWLxBswi04VmI3jQBTu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ryfJyFtEZkcPytUI0ZpxSgfv2O7as4F+UI2471yCiPVJSaBUJScPbEmiu4e8R7CaCdImNcLD5SMTS4C4q0B6VAIfXwmH9UZr2JTDRrJrxKfN8r5++TnKp/rZUTtI5xhouK6z/b3HC86MsVgyaIbbhj0+exBmeJDrTWGN/Qu07hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=YrNZTWg9; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="YrNZTWg9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=uyXE9z92I4PX0TtZ5pXguce6WvvMl3Q/lq0kSB/sMdk=;
	b=YrNZTWg9J/AdumbnX/n6jAWEoVVEOVi7g/6rUn2Xf1pW9g49cvJznInVK8iBmw
	sjH8CgMYKRaMXypEuUiVmBdawzQm941OU/0L/SGcXzxGF0CZGuTqNFNbkVejp399
	xkyDVb/6yNU4KNajjjN4ILJesEudsFCElSFDTFYRP9ueQ=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAnlttq3qdoPKAkAw--.15496S3;
	Fri, 22 Aug 2025 11:05:16 +0800 (CST)
Date: Fri, 22 Aug 2025 11:05:14 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frieder Schrempf <frieder@fris.de>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>, imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andrej Picej <andrej.picej@norik.com>,
	Annette Kobou <annette.kobou@kontron.de>,
	Eberhard Stoll <eberhard.stoll@kontron.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Liu Ying <victor.liu@nxp.com>,
	Oualid Derouiche <oualid.derouiche@kontron.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Teresa Remmet <t.remmet@phytec.de>,
	Tim Harvey <tharvey@gateworks.com>
Subject: Re: [PATCH v2 00/12] Misc fixups and changes for Kontron i.MX8M and
 i.MX93 DTs
Message-ID: <aKfeaiYasvynXGbn@dragon>
References: <20250721100701.115548-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721100701.115548-1-frieder@fris.de>
X-CM-TRANSID:Ms8vCgAnlttq3qdoPKAkAw--.15496S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7trW5ZF47KFW7Wr45KF47twb_yoW8JFWxpF
	W8G39rKFWktr4rua4UX3ZrKFW5A343GFn8A3s8J39ag3sxCa43XF15K398WFWUCr47XF4k
	tFy7J3s7K3s5ZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UdgA7UUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIQzWPGin3mzS8gAA3a

On Mon, Jul 21, 2025 at 12:05:34PM +0200, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> This is a collection of changes for several Kontron ARM64
> board devicetrees. Some are related to hardware changes,
> some are bugfixes and some are improvements.
> 
> Changes for v2:
> * fix touchscreen node name
> * add touchscreen labels
> * fix commit message for RTC interrupt patch
> 
> Annette Kobou (3):
>   arm64: dts: imx8mm-kontron: Add overlay for LTE extension board
>   arm64: dts: imx8mp-kontron: Fix CAN_ADDR0 and CAN_ADDR1 GPIOs
>   arm64: dts: imx93-kontron: Fix GPIO for panel regulator
> 
> Eberhard Stoll (1):
>   arm64: dts: imx8mm-kontron: Use GPIO for RS485 transceiver control
> 
> Frieder Schrempf (7):
>   arm64: dts: imx8mm-kontron: Remove unused regulator
>   arm64: dts: imx8mm-kontron: Sort reg nodes alphabetically
>   arm64: dts: imx8mm-kontron: Name USB regulators according to OSM
>     scheme
>   arm64: dts: imx8mp-kontron: Fix GPIO labels for latest BL board
>   arm64: dts: imx8mp-kontron: Fix USB hub reset
>   arm64: dts: imx93-kontron: Add RTC interrupt signal
>   arm64: dts: imx93-kontron: Fix USB port assignment
> 
> Oualid Derouiche (1):
>   arm64: dts: imx8mm-kontron: Add Sitronix touch controller in DL
>     devicetree

Applied all, thanks!

