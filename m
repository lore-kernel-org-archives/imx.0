Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC97A62B
	for <imx@lists.linux.dev>; Fri, 11 Nov 2022 02:35:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD4D3C433C1;
	Fri, 11 Nov 2022 02:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668134152;
	bh=Kpivm6/kNme3G5wj03/48cDJZsJHfiRxJsW2BVujKBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cOmEvTT6bfugYGy3Ga8HU4R6F4h6myeAwwRvvUUnxrPHFJs5S+D7+w+WFOaVIlZTd
	 UuErJLaSlEJcgjEKzHXi/g1mSRYXFeZ54Hv07DpFlY+mvuTVpvGJHIS1L4AH9deLkv
	 A5J1ghF3CgI9/+U4yWIsf57nnfjslh08TQ3kJLjqmKPTaGFrNbfexrG0qhJ9CDGdMB
	 WUQN+SpP9ejQ0Bh3I+pJ2W/v6U0c+kkU0yF8HJazh+8qpS3sZOEpmqKk5Hvdd1wxqJ
	 8Jj3RBNEDWk0vd/gTPp41EJGA8LLqmuByXGVp5wZ9K8U50LfSFUj9AB9h/Tt4gAqJT
	 28jja1P4MS8IA==
Date: Fri, 11 Nov 2022 10:35:35 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: Shenwei Wang <shenwei.wang@nxp.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v4 1/5] arm64: dts: imx8dxl-ss-lsio: add gpio-ranges
 property
Message-ID: <20221111023535.GF125525@dragon>
References: <20221027130859.1444412-1-shenwei.wang@nxp.com>
 <20221027130859.1444412-2-shenwei.wang@nxp.com>
 <CAOMZO5Cy3h50QmjnTBDNweQS3JZN6HEx6A549860hUg5opuftQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5Cy3h50QmjnTBDNweQS3JZN6HEx6A549860hUg5opuftQ@mail.gmail.com>

On Tue, Nov 08, 2022 at 10:29:53PM -0300, Fabio Estevam wrote:
> Hi Shenwei,
> 
> On Thu, Oct 27, 2022 at 10:09 AM Shenwei Wang <shenwei.wang@nxp.com> wrote:
> >
> > add gpio-ranges property for imx8dxl soc.
> 
> The commit log could be improved by stating the reason for adding gpio-ranges.

Shenwei,

Could you resend the DTS patches with commit log improved?

Shawn
