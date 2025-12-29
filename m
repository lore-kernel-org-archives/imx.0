Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96AB3115B5;
	Mon, 29 Dec 2025 12:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767012238; cv=none; b=IUgzdOOxSW9zdmj2sUARMRuGEmXF2k0oW9h88CifcJyOVGCnlDp9ISq6L3K557FkszPXHGynC0DqzMg4muIMQG4r2V1aQ0Y90iy3/kp60HtBNHi9GTNjQAvFyvI1ME2p1QKqeSI5H/KCec91cG4NI9tuZb4jE6gjg/QWOnx6CBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767012238; c=relaxed/simple;
	bh=PflFpSdgfw64KNh6dNwM1X7/oaXn62aN7cbcelp7pl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oktB6iBZTfdA1Qg4tbCi4eU2jVFwPMRmalmt4i2P9LDWTKrtsyPHnMU4pX4ruaZYi9VGzvpwb4DCqu4XgzUiQrGNPrK4ckhRw4+pbbsw7yYl6oddNmf3A4uQTSDIxcAgupcHhL/OvW0dKWmpQ7NsUWLaWROqXBnD1iQepiL3IQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bQM28xFl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bQM28xFl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4551FC4CEF7;
	Mon, 29 Dec 2025 12:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767012237;
	bh=PflFpSdgfw64KNh6dNwM1X7/oaXn62aN7cbcelp7pl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bQM28xFlgX1OzrCkpMztchIYsjVjBlrJsoGTmoX/vVGqzoPeRsxKE9dJi5BWR8ebN
	 qomEQqK0bLAhv9a4crOEDCY20ig/Y1PUl0qE6ftbVnvipV60sRmo1jLQXNhXitkfNV
	 CUmlRmKTNdFLQBrjfZOSKLGSm3rNrzvXcQ9loo3ba/D/VuFI5poaCBtP8fcugVXgXI
	 Gprfk3r4518Dz9alFegcxLiMu/LFxRK9mIHKHPx3mIZ+Ouzz4sENSLvrB5Jv9+oLuj
	 Uc46JenoYu/DMzoXnVgTA2+hg7maTgw1JjqntLboudXcFOUKIv/odcgEoKD6W495va
	 33w1XABJd80DA==
Date: Mon, 29 Dec 2025 20:43:47 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:TQ SYSTEMS BOARD & DRIVER SUPPORT" <linux@ew.tq-group.com>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: mba8xx: replace 0 with IMX_LPCG_CLK_0
 for lpcg indices
Message-ID: <aVJ3g_V_xWStfGHi@dragon>
References: <20251120214318.347483-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120214318.347483-1-Frank.Li@nxp.com>

On Thu, Nov 20, 2025 at 04:43:18PM -0500, Frank Li wrote:
> Replace the 0 with IMX_LPCG_CLK_0 for LPCG clock indices. Although the
> numerical value is identical, the LPCG input is defined as
> IMX_LPCG_CLK_<n>, so using the symbolic constant improves clarity and
> consistency with the LPCG clock naming convention.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!
