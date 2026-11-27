Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795793900;
	b=Lu5nkoVUOcOP7j6LBzO7jR4j8paNvZgEGlti6kyrodUdESXcZxOowgWqmzZfa3LPLo7U
	 jN4DellcFJ1Sim/L3ZDZxsKmPYXrkvoP6QLBiJ7xtJX+hY8t9Ed+T2vaw3jKHlhKz5W4U
	 rEPu6xWXIx7U0r/qgP5Fdea57BPSk6w9VErDWnRIjIvNd/crmDNp0fOziwCR2m2yxEPet
	 RiHaYO2HXW8RXnueA7vM3P4ymTbRHPSzNLGlN4qQT4AHsi6a81BGHviFNxe0WeBxEvXqK
	 244vkcdOC+hqdofdfOM1sA3glpGDbbL6FNdRzSSgn7DC0r5reKhuRMHNayPDQLDLcSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793900;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=ixVHN+f6bXwbfLfqFXi/FG437hi5R5SCUVq9nvoVZsI=;
	b=H4SHlOfSse/LPK6T+sRTVbQx49HmkDh+j+rwt+pQcECu9Cd4QG8GfkMG5yUj5JmCg7eT
	 SAQdetxpgvqvPnMd0BHzNZlm9RqDGfRQgnN+Qm9Eq/RP5HiGxmFuMGCFRI8bq8Zp8irra
	 k7CspMF9JmLI5N/PxwN5/36RnmqLhwVHF1MTG4FYBXFvpYZZzbYSAQV41RNjo148zCtgW
	 cYyxpRIcaNNDly6DpQLTTE+nAgRbwjCAX/AvBc7HLBPHdklLXbpBWhn41treAHxr/P24v
	 /e7a7+DVl32DMwJNjdCyOiogSqcEpnEpV89QF8IGkj6q4ozueceNTLuwaSw52uTHzGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=YcL0qfny;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D009606A324
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 15:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D009606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=YcL0qfny
Received: from eig-obgw-5002b.ext.cloudfilter.net ([10.0.29.226])
	by cmsmtp with ESMTPS
	id WwzTxeV25OOJnWy1jxiKEg; Fri, 27 Nov 2026 15:38:19 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Wy1exnOQhb2qJWy1exruH5; Fri, 27 Nov 2026 15:38:15 +0000
X-Authority-Analysis: v=2.4 cv=A7tsP7WG c=1 sm=1 tr=0 ts=6b09a3ea
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=p-LfKV-GAAAA:8
 a=VwQbUJbxAAAA:8 a=sOfCyYYy1NGfjWDh088A:9 a=CjuIK1q_8ugA:10
 a=97BuGM4RKn6GwmfqMd6i:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ixVHN+f6bXwbfLfqFXi/FG437hi5R5SCUVq9nvoVZsI=; b=YcL0qfnyoM1bBp23CVqi1J2zfM
	CiSXjtSQ7WGuRmME88zFXxggvDHzcN55VJ2FADsqbqXksEbU4FgbKbtczbcFrItzUBqP7ehb+VRu9
	aJ4m0h5qAiNwObhhPlH1AiEWg/JgLuPRwprU+kwLdmCwdpGSaDeoonKUiZ8bdgjztLnscmzfC869t
	eXHDiaHA8nn60bNiYatqhKXLUKAJXmN3rLfnxs52tS3+xcnhMVK02XjPPK2suwTPVqXZmUMJ4Ik4Z
	V+oPk80B2Isk6XZ3cOKiII+w/fmFYJVgl4aBna4RR9RuC7v1vNbYGWiS9Su94jiFPA1LZraFZTBP5
	qo2h6kbQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:53908 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xWy1c-00000002P4I-45YY;
	Fri, 27 Nov 2026 21:08:13 +0530
Date: Fri, 27 Nov 2026 07:38:11 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Lukasz Majewski <lukma@nabladev.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v5 2/3] dt-bindings: hwmon: Add National/TI LM77
 temperature sensor
Message-ID: <1c56cd6a-18f2-4104-9d5d-1c6bff6dc848@roeck-us.net>
References: <20261126124402.3015577-1-lukma@nabladev.com>
 <20261126124402.3015577-2-lukma@nabladev.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261126124402.3015577-2-lukma@nabladev.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xWy1c-00000002P4I-45YY
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:53908
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 7
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHVHn4tulBFxfzp0Ph02J//rccrRaEahguv5vix0wyHOh2KWC4traO5G3DRz5tO7UAPan5D3rfvWdDe1COAuolgrIYn+JBjdsy6e4Sg9l1knHeRs9+kT
 ccVafBibMSj7nKDHZSg+Khw5GRY+9psrt7K7+D6wJOHc/WQuaRom9Aek2Uwsa8CSqlhqJGzehnm3vyKiS+FD8janOUWPIzAua28=

On Thu, Nov 26, 2026 at 01:44:01PM +0100, Lukasz Majewski wrote:
> Add binding description for National/TI LM77 temperature sensor.
> When compared to LM75 - it has two output pins one for interrupt
> and another one to signal the critical temperature alarm.
> 
> It also has only two I2C address pins (A0 and A1) - possible I2C
> addresses are: 0x4[89ab].
> 
> Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter
