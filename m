Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D84376465;
	Thu, 11 Jun 2026 09:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168782; cv=none; b=fSh3YhdJJulMxFsQFAdOGEq78JvKUQr6HUxFGP/5WFhTZQDhqVCmaIMyjvuOM7IAtrB3hOuqlR3/THkOLtmH5UKwFNE1gGg/7qryBC4k/CP6Ypg4t/JY5bi3oehaQwK263e9wt/02K11DaHitS1aPHzHiuby8oMPRXWxvXV8T4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168782; c=relaxed/simple;
	bh=4AUvjuai4N+RkIT8LkzS8PD4w+SK8CcYOYgKFVO2Vm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IK0hcsPMcymMkL6Z+fDtI6hOecUCLrZWGehxuRnh1XVFHzu0rVAfg1+n6bRdBhqfdogSVhXsqGLKUbBaHKg61yZtdZOa25EygY/+t1kGi4s5D1/51qL/Yvv3K6Ad6bvuy77AntTHgO6ji+bRXUTZkri5S+rifxuO22CeY5KSf7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kucb9rwc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kucb9rwc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE3491F00898;
	Thu, 11 Jun 2026 09:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781168781;
	bh=WbHo0RwI9j3Vdth4NfkBJIy1aubZyvoaCPcPZk7uecY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kucb9rwcHEXWUXr8GWMIN4nP/+rRE9XttQY0S+Zj5R9LxhwYhLrtkW7kiqK3T9wsA
	 K/LYBXzTyz+OXKned5q1s7+VHP8RPSuxThdytrcODgkZ+WJJ/oG+3CGGmKhET8HXpY
	 96GI9HN+WxBg41+Wpnt2hKpwERANapi38JxjM889yFXkDj+8pqgbvMKmuX+EUpasu0
	 Y3Pgl6cTE54EJtrPpncQUxLpAF2gizVoAbPBxi0M7QYS767K9QRKZ4hJY4mPgXfCW5
	 R6GhQAyLqv9M0aK9rFaK9KUUs7A/T4YuH4U5QqSC7E2AxD/lNuY63y47PkN6BMgOHx
	 eTNvgHmZQX8zA==
Date: Thu, 11 Jun 2026 11:06:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com, 
	Stefano Radaelli <stefano.r@variscite.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
	Josua Mayer <josua@solid-run.com>, Maud Spierings <maudspierings@gocontroll.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: arm: fsl: add Variscite
 DART-MX8M-MINI Boards
Message-ID: <20260611-primitive-kind-crane-aa9800@quoll>
References: <cover.1781024557.git.stefano.r@variscite.com>
 <a3355082aec3454f671b44e1f9a78000d2733470.1781024557.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a3355082aec3454f671b44e1f9a78000d2733470.1781024557.git.stefano.r@variscite.com>

On Wed, Jun 10, 2026 at 10:58:53AM +0200, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
> 
> Add DT compatible strings for Variscite DART-MX8MM SoM and Variscite
> development carrier Board.
> 
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

