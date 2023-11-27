Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D45810F3;
	Mon, 27 Nov 2023 02:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="esUJY4t2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05E88C433C8;
	Mon, 27 Nov 2023 02:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701051707;
	bh=bC2ssL/QECbp/dStYuVy7bosUCcMH2N8jkkHjJLYJnk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=esUJY4t28KqAgZi/NF1BJyvYwUsOTktrX0mBJwlFALH1aUm04CCexiidqrEj62rrR
	 BG3QcWecVE5NUN60mHWGx4SGYzV233ltR7ooW1dO42dWuU2bitFPGi9MxptzCzFJSs
	 t+TvM3XCED+uQ7NK6D28ct22hL54NBucjrD+CH6Qpt0ANLIt7FMrWUJMq16cSinVwR
	 DbhGZeqLSi1vlqqoXpq4fHYOD+qkpKDuhz+507iEc5l1M1pRHLDryb2/rtVL9Xd4h7
	 iaOugiYBPUotxLOhUh9R/IX/Qi5F97X3OW46oWQcrLwBqeevgXmwVQk/JgZSSSFTNb
	 eAAtKGtcIWwJA==
Date: Mon, 27 Nov 2023 10:21:40 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: alexander.stein@ew.tq-group.com, alexandre.belloni@bootlin.com,
	conor+dt@kernel.org, conor.culhane@silvaco.com, conor@kernel.org,
	devicetree@vger.kernel.org, festevam@gmail.com, haibo.chen@nxp.com,
	imx@lists.linux.dev, joe@perches.com, kernel@pengutronix.de,
	krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-i3c@lists.infradead.org,
	linux-imx@nxp.com, linux-kernel@vger.kernel.org, peng.fan@nxp.com,
	ping.bai@nxp.com, robh+dt@kernel.org, s.hauer@pengutronix.de,
	sherry.sun@nxp.com, xiaoning.wang@nxp.com
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: imx93: add i3c1 and i3c2
Message-ID: <20231127022140.GJ87953@dragon>
References: <20231017194657.3199749-1-Frank.Li@nxp.com>
 <20231017194657.3199749-2-Frank.Li@nxp.com>
 <ZUz/8fBWtnwdSW9w@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZUz/8fBWtnwdSW9w@lizhi-Precision-Tower-5810>

On Thu, Nov 09, 2023 at 10:51:13AM -0500, Frank Li wrote:
> On Tue, Oct 17, 2023 at 03:46:57PM -0400, Frank Li wrote:
> > Add I3C1 and I3C2.
> > 
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> 
> @Guo Shawn:
> 
> Driver part already merged. 
> 
> Please pick up dts part

Rob had a comment [1] about SoC specific compatible.  That's not what we
want?

Shawn

[1] https://lkml.iu.edu/hypermail/linux/kernel/2310.2/03035.html
