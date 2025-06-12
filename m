Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F7825392B
	for <imx@lists.linux.dev>; Thu, 12 Jun 2025 13:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734273; cv=none; b=N3Eg2j5PvcJmg2mFwEqDQUBrVHT6vYxybI94hm3E5A7b0UBBehpERW2/PZ9CaZE22xmKuaQ4VDIzfMIyIgW8YpIo9oML+lCQmzryUsMlQthkHnnh2RCXQW84suJcwuliggIJXNsE5f0NKv7fH9kO3JlePt+jiwjeXlq13c42ieY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734273; c=relaxed/simple;
	bh=VabmgeLdDt1I8mhmTB5n9mUn+CV3HPyXX8NyFbEoGN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uny9smgdsJUXwJFnaBB9DxxZJ2LZqL+ighm661d9YyoL0ZrxHSZ0iVSyIxVwh04/ruxe27AbuYolTiDZo8DwLMF9o3qE4/uWmG4NlPHskn/QChTl35w9hb3+RlUteuiMN1QOxPzNVwBtk47W/4qIVGd/4OX01HxsMdB9i2ZHpaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uPhoJ-0003C8-Ji; Thu, 12 Jun 2025 15:17:39 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uPhoJ-00389N-0z;
	Thu, 12 Jun 2025 15:17:39 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uPhoJ-008vXx-0a;
	Thu, 12 Jun 2025 15:17:39 +0200
Date: Thu, 12 Jun 2025 15:17:39 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com,
	Ahmad Fatoum <a.fatoum@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 3/4] arm64: dts: imx8mp-nominal: Explicitly configure
 nominal VPU clocks
Message-ID: <20250612131739.w2u3olqliiipxzl6@pengutronix.de>
References: <20250612003924.178251-1-aford173@gmail.com>
 <20250612003924.178251-4-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612003924.178251-4-aford173@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On 25-06-11, Adam Ford wrote:
> In preparation for increasing the default VPU clocks to overdrive,
> configure the nominal values first to avoid running the nominal
> devices out of spec when imx8mp.dtsi is changed.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
