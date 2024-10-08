Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD03818DF65
	for <imx@lists.linux.dev>; Tue,  8 Oct 2024 10:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728382342; cv=none; b=P+nLOKqV8Y9eZka/uJgwi/aIjHhtmey51HWg0Wul3XBQDy//LNP+Os7CquxBQHI+ctegR2VN0mDJRdYIGxW6dSlA6Dku6wKl8WRd0686KVgYc8TUqzGEFSoAfzbW06U1wy7qe6YVObFgBonTEPBOmsQcmEpb3lK+UHZlB9YEt0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728382342; c=relaxed/simple;
	bh=LT6tVZ5fR1YC44235qgb8Y+HXZK+9cZRuJKZf/Mf89E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tFpLrXU4Rxh7yZ9Elf4MO5dRro4WTPNwI6EGrn161t9/Cxw/ZYGPI4Q/qHScwkf/KjMDhILM9JuCSVwu+s81DIIhUkD9ev15TCAWGrkD+kPLkQ+XeS3GH9dCB45EQQq/eCriNuw37KDygV0nzFQ8ZuZHgnccf0ZR2Xm8gNrkl3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=FSGgDrOz; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="FSGgDrOz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=LT6tVZ5fR1YC44235qgb8Y+HXZK+9cZRuJKZf/Mf89E=;
	b=FSGgDrOzQjsOKQ3S/p2OxVRngsgTQzfOgR2sVWaRBAR6NT0Nkdq8hxRVPRLnGh
	euKyVg5Yp5P0w91CRNs9QeH2zY4HheoxnvWDeO6v45MjBxR/Nh8cRW6aAut8rmXN
	vFLFabYf5S6lIIg8Lc02WUbFMWuFWVBnYVTRdSB0Mx9c0=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDnf9eW7QRnyJzcAQ--.40279S3;
	Tue, 08 Oct 2024 16:30:16 +0800 (CST)
Date: Tue, 8 Oct 2024 16:30:14 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH v5 0/4] Add dbi2 and atu for i.MX8M PCIe EP
Message-ID: <ZwTtlmUWD/b1Jzi6@dragon>
References: <1723534943-28499-1-git-send-email-hongxing.zhu@nxp.com>
 <ZtMUbpBJscWlgkhW@dragon>
 <ZtgqmCbkD1ruZr4U@dragon>
 <DU2PR04MB86771BA534FF1A8C0AE5B8618C692@DU2PR04MB8677.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU2PR04MB86771BA534FF1A8C0AE5B8618C692@DU2PR04MB8677.eurprd04.prod.outlook.com>
X-CM-TRANSID:Ms8vCgDnf9eW7QRnyJzcAQ--.40279S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVxR6UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgRyZWcErZHI0AAAsG

On Wed, Sep 25, 2024 at 04:03:03AM +0000, Hongxing Zhu wrote:
> Hi Shawn:
> The dts bindings change had been merged on Sep 06.
> Can you help to merge the others?

Applied, thanks!

