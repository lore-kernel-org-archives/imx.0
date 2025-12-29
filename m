Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39AD3148DA;
	Mon, 29 Dec 2025 12:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767013171; cv=none; b=JS4Rq9onsvpVlzgZdJxtC3iloZZIpogeGsulQNUp8BW62wkLtZfbcUAumF6U/AOwWmL/t4Ei3b8iZcwI7rdzj7a9uMGXOqVb6eDDBnmio8m1spadV/IHYBx+PnRg8qsTTGmjd1oLxNEzap01PGddTNqBB89UBco+pO7Q4POjD3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767013171; c=relaxed/simple;
	bh=UE1qaCpa8Xzfpci0DbcJIkq9Z3U1GQTGZeeLueNA130=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZjQmIbeUgQjNzmPPeBJIpwjTma9NtV90vmOcCOA4ts93oEvPg33T3cZkgPtrsNeodzmiNxB318nIdTVcMMm3y7K8hWsgSHRMSlHt+CG5/y7glo19pzGLDgQKYLBJZ/IWLlUcLgt3q/AEb7jsYtGHjxONs6dX4DXv4ahk/XPJdeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ABcy121y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ABcy121y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66275C4CEF7;
	Mon, 29 Dec 2025 12:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767013171;
	bh=UE1qaCpa8Xzfpci0DbcJIkq9Z3U1GQTGZeeLueNA130=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ABcy121yrODltMJwHB3214c8IPI0KZCrt34YETZuwPWx4zjMTkV6kW41vtvqvmfMC
	 cQbDU/n6XSKaj7CBDKQMU+2ci/fgh2C0wZ4nAwnID1znUG2NbsV8WzKSVox1ONCuRB
	 erE0nNtJKjqXQqjawBb+AtY/8MrymEiEUAtc/MPEs34xndD088eqFutYpstCl870Ay
	 nTHzttsYAvVXKEpja9m3IVowdJkEtsdBJlADt48+MtUshiAaOpdkvuO+8+YEA2hdWz
	 DARwyKlTvvluZ/jMW8mEG4LIHnLfzvxVFLk6WlrZZ+gW2Q3WYfPFqwyaoPLcQoZsNP
	 JosKaLPxrKQYQ==
Date: Mon, 29 Dec 2025 20:59:19 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Rogerio Pimentel <rpimentel.silva@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, krzk@kernel.org, kernel@pengutronix.de,
	festevam@gmail.com, alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com, marex@denx.de,
	Markus.Niebel@tq-group.com, y.moog@phytec.de,
	joao.goncalves@toradex.com, frieder.schrempf@kontron.de,
	josua@solid-run.com, francesco.dolcini@toradex.com,
	primoz.fiser@norik.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: arm: fsl: Add i.MX8MP FRDM board
Message-ID: <aVJ7JxBxsnEmrbSq@dragon>
References: <20251123181444.266030-1-rpimentel.silva@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251123181444.266030-1-rpimentel.silva@gmail.com>

On Sun, Nov 23, 2025 at 01:14:43PM -0500, Rogerio Pimentel wrote:
> Add device tree compatible string for the i.MX8MP FRDM board.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Rogerio Pimentel <rpimentel.silva@gmail.com>

Applied both, thanks!
