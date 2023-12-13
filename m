Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6033EC2DF;
	Wed, 13 Dec 2023 08:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QJdSEwli"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E430C433C7;
	Wed, 13 Dec 2023 08:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702455150;
	bh=6cLOPwMjvibdut8r74sh4DxCF/rsyHgNZEROG+kEFS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QJdSEwliaWDOQ8h2zpaMPCQFomNMzh/55V7/+H/gp/dXljDPmlxrGtx6XFFm1tQE/
	 8gmLtvdsVItk/iYq7mWa9d2KFH9OBN571ISMYXNHcczop0WG8zwYPAqYoJgvBboISu
	 BzcTBdad+gI+5/jhTQaz+w6MIlSyvQhvB0ogrkAnSAjr0FHtJQqw+cXWc/8T++FJfT
	 DGGCcTHZbhKBXykiJ0AZcaoB81ELuuCBErPaeL0KYEgZD0r1K2T9+TMwNYDVKG9fCV
	 b3gsDzzmj2JhUaPnwEW7VySWloSD1GzirhhRK1uCQf23Fz1h8RMjfu1NRnONhXUM0j
	 s072YauCltlFw==
Date: Wed, 13 Dec 2023 16:12:23 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: miquel.raynal@bootlin.com, alexander.stein@ew.tq-group.com,
	alexandre.belloni@bootlin.com, conor+dt@kernel.org,
	conor.culhane@silvaco.com, conor@kernel.org,
	devicetree@vger.kernel.org, festevam@gmail.com, haibo.chen@nxp.com,
	imx@lists.linux.dev, joe@perches.com, kernel@pengutronix.de,
	krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-i3c@lists.infradead.org,
	linux-imx@nxp.com, linux-kernel@vger.kernel.org, peng.fan@nxp.com,
	ping.bai@nxp.com, robh+dt@kernel.org, s.hauer@pengutronix.de,
	sherry.sun@nxp.com, xiaoning.wang@nxp.com
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: imx93: add i3c1 and i3c2
Message-ID: <20231213081223.GH270430@dragon>
References: <20231017194657.3199749-1-Frank.Li@nxp.com>
 <20231017194657.3199749-2-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231017194657.3199749-2-Frank.Li@nxp.com>

On Tue, Oct 17, 2023 at 03:46:57PM -0400, Frank Li wrote:
> Add I3C1 and I3C2.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!
