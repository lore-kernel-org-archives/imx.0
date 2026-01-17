Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595F0328B77;
	Sat, 17 Jan 2026 05:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768628544; cv=none; b=UhsJOKRN2lPD1Cqr1qLgRoIhhWareck0Pkk7hZOI0a1SxxKt5GQwxPCrOQbhyhULew+oyto2v7cFquadpeB3aanuba1WBGVCXxW6zE//Ni0YIFRDwMYS9qhveUI9T3/nI1gVy2H6nrxIY/uL7GnHk3cDB8QPCViiMTotySm405g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768628544; c=relaxed/simple;
	bh=bwlkfXsLFvt1yMomv6AquM31sE55b0EH0gvYr8WZzms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MDoyoI1gvVUiexRTyIJTeukHsT+IxZW0zYQAAh/4mnQNb4jWo84S2gQgRE5FanguL34A1cFPQNbQGjMXlX26IUUt/DFPhVahc8pC85dhYU+2mvJcZ/joVuNzeenPrpfommZ6Mm71bWZpk09b5Hbpq4RCOG9oNIxmBiz6V+ziidM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rTGYgQvI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rTGYgQvI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F3D1C4CEF7;
	Sat, 17 Jan 2026 05:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768628543;
	bh=bwlkfXsLFvt1yMomv6AquM31sE55b0EH0gvYr8WZzms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rTGYgQvIkJWzeGmn4+Li1EgCuHH5sDjQ+TCKichzFVNRD9DHexoXGZctijM5n6aYy
	 E12la7VKZhswF73Y4TAVO0w6YITesx7mQlehrWGvtTtzZTFxbjW/skXJyxINVrXfGa
	 fmZS85gcfzVNPLJMoDMLBob8wS/Deiw0qozb7Z7djI5GXQt+eKVyonAK9FfY6cfJTZ
	 02DtGKJtxtNrpPp9xfG4729ffZPSRbeap3egfkVQIKeLPodm7UDpAKFLCaHBzbNFx8
	 zZ01i+iwPtrT8O+k4OFsEkphFvaT/JK6iESKgMD6sZY/rDaL8AGMiFr7YulpIg5g5H
	 osKBQlrfpQu4A==
Date: Sat, 17 Jan 2026 13:42:16 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Frank Li <frank.li@nxp.com>
Subject: Re: [PATCH v23 0/7] firmware: imx: driver for NXP secure-enclave
Message-ID: <aWshOMxbdqOI9KA9@dragon>
References: <20251219-imx-se-if-v23-0-5c6773d00318@nxp.com>
 <AM9PR04MB860402EC5CB2FB8FC1A34287958FA@AM9PR04MB8604.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM9PR04MB860402EC5CB2FB8FC1A34287958FA@AM9PR04MB8604.eurprd04.prod.outlook.com>

On Wed, Jan 14, 2026 at 08:38:44AM +0000, Pankaj Gupta wrote:
> Hi Shawn,
> 
> If there are no new comments.
> Requesting to consider this patch-set to be merged to mainline.

Hmm, it seems that kernel test robot has complaints on patch 3/7?

Shawn
