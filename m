Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810C2185628
	for <imx@lists.linux.dev>; Wed, 28 Aug 2024 13:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724850726; cv=none; b=R05baZ6982c++DtflQb9VEQWzx7pBZHhLio+qn8dxZ7vcRXkYoNlhdbs7bgasQygFlXuGIG4Ikfiw3NuZErbfz0q5M2+u+enJQZFnK1LL3x94NglRrgDR+RSYBrrGXnOk74V3dq+cYUOs3dQ+4wQGxlaMM63NTyyhrQSc7tX7qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724850726; c=relaxed/simple;
	bh=dRZBUm35FKx7TMrI0AnGvC4/W2Ci8s9JAs1kf2GC3/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ssb1QN0eW0bDZkjtbelPbHULZEiMz7pCjH7fF0lhMrCZZNZP5EEF+kSuyEKP1uQ3f7IJ7CmvEzkJOsgacP/2MuljS87J79dRwtK97nHMviPt0tjDx02AiWUIwnF5VQjI04kATuWmN9BwoRdNEM9X2U49psMV0HCX/qn8JDx0VGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=WRY7RmRO; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="WRY7RmRO"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 00C5A2135B;
	Wed, 28 Aug 2024 15:11:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1724850716;
	bh=OA3RlbQPp35zHlhXrGz11KOGNwwXkfIeHSoFUZrWFZI=; h=From:To:Subject;
	b=WRY7RmROe/6Y8pe37PVm1Xqiv7e6/ZJY3TpNgxRCaB/fCv4MwOmvtA7VAQnDnGTMk
	 r3cvw8jJhplp3LQEBd0ZuRPhw2Mmj4Yro0Wis56InpI9RTJ1meDlQCy+HM8JHePxlh
	 NVj5Gf7v8kKTPzENH1jwLJK/F/aMHDqZjFPM/SxI7VzjDZ9vI26c2jopNXIuTdmBU8
	 4HxRPqFiHNDew64YGnz2k/hAekH2rSlIblnI2kdaG3QAxxr2xxNpvDNss8rz1syQab
	 OEuED07N3eZMbhuje+/0yUuNyjJv0vXXX/CvDRGRPAN0yLO0F3hviVbn1fzXMbcqpM
	 80QO7YyBZYjPQ==
Date: Wed, 28 Aug 2024 15:11:51 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 00/10] arm64: dts: colibri-imx8x: Various improvements
 and additions
Message-ID: <20240828131151.GA35119@francesco-nb>
References: <20240826215922.13225-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826215922.13225-1-francesco@dolcini.it>

Hello Shawn,

On Mon, Aug 26, 2024 at 11:59:12PM +0200, Francesco Dolcini wrote:
> This series improves Toradex Colibri iMX8X support adding:
>  - working ethernet
>  - correct PMIC thermal zones
>  - USB support
>  - analogue audio
>  - ADC
>  - PWM
>  - VPU

there is one small fix to be done on this series (id-gpio vs id-gpios)
on patch 1, if you feel like this is the only blocker for this to be
merged I'll send a v2 soon, otherwise I'll wait for more feedback.

I'd love this to be merge for v6.12, but I do not want to spam the
mailing list and people if there are more changes required.

Thanks,
Francesco

