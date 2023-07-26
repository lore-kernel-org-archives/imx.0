Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFC4CA77
	for <imx@lists.linux.dev>; Wed, 26 Jul 2023 11:58:54 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-31759e6a4a1so3139576f8f.3
        for <imx@lists.linux.dev>; Wed, 26 Jul 2023 04:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690372733; x=1690977533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YJ91wGokauJt4h461pORCO4RNq/KJQrLD2WGJ0qohX4=;
        b=WfOT5xvfNh1iqk7syIg4kmyVDW1YhagEo9TzC/tD06pO4vrsQ4MCLgdQ3qubnkjPos
         0MjcaOIshsAbJ3b0ZyQ4EFafw2UNgqwy/kpns0gZmHSGEmLrgfdQQJKd76IEsKjgxBI9
         eRnQF2mGHQIc32YBZJX8cUx7Y9FLjzE+Zn4+c2OkS6qsoSdvOk1660qLAHshT6VWCoyO
         I0cQx01jwCs2sqioRIsoBWNJHSKxYRH/pwlyN8iIMJOVjAmPkIPG6esoS8row+7hfJ3U
         8Xks2c29yQRAaY6cVudPd/rghlkfdrhQGUCAFcoqnhHhgtF6CaYrUb6i9PJX3RfBTfg5
         rM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690372733; x=1690977533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJ91wGokauJt4h461pORCO4RNq/KJQrLD2WGJ0qohX4=;
        b=BD/E8p4PI1w6b9N+ev1gzWKk4OiaEzPhH/bc9uCtxmyrnvqEYD2rgb/2WlkspQkPNH
         QiitXdohH7j24SSPXulFnRSnUQbfXHPsrVBhL82AGBD/Gy5Ix8fpJooj+BrBeBBfWS+b
         LvStf3JfdnQvdknyUHUZGu6UAv/F3yteMLlwxqjvGmehYaeDojvY4pY1e+eXxiN/0yF/
         ewjbYmA5cmUVoRfxomCfgNGhdOLv5e+AqAt0y+2ezP59PKKj53RWLJa2Da96+eKxiyeg
         RSw5qEARK7VMxxMxHdmxhCwXYJvEHO3q3Y1biSdhs1UPMlrDC2SVw9+95bcPUk1fn6ng
         mNEg==
X-Gm-Message-State: ABy/qLYPnWOKUG0P8hFNzYf39J3wJKVRpGTedmV837L5TEVRFyZkk5mI
	poc1pVryab0g9LXvnYXsSVY=
X-Google-Smtp-Source: APBJJlFBFaQBLrypfkvQRDfRCg0hi3rQU14s0ZY/E4YmE5tBxKcBDLE/uZ5R5xTim3l+zb9eZtCMbg==
X-Received: by 2002:a5d:5707:0:b0:316:f06c:f07 with SMTP id a7-20020a5d5707000000b00316f06c0f07mr1132298wrv.64.1690372732766;
        Wed, 26 Jul 2023 04:58:52 -0700 (PDT)
Received: from skbuf ([188.25.175.105])
        by smtp.gmail.com with ESMTPSA id m12-20020adff38c000000b003145559a691sm19675103wro.41.2023.07.26.04.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 04:58:52 -0700 (PDT)
Date: Wed, 26 Jul 2023 14:58:49 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Shenwei Wang <shenwei.wang@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
	Russell King <linux@armlinux.org.uk>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	Frank Li <frank.li@nxp.com>
Subject: Re: [PATCH] net: stmmac: dwmac-imx: pause the TXC clock in fixed-link
Message-ID: <20230726115849.ljzczotegiqlvmi6@skbuf>
References: <20230725194931.1989102-1-shenwei.wang@nxp.com>
 <93ffd7a5-2479-4726-b26a-aab10ac09d14@lunn.ch>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93ffd7a5-2479-4726-b26a-aab10ac09d14@lunn.ch>

Hi Andrew,

On Wed, Jul 26, 2023 at 10:32:00AM +0200, Andrew Lunn wrote:
> On Tue, Jul 25, 2023 at 02:49:31PM -0500, Shenwei Wang wrote:
> > When using a fixed-link setup, certain devices like the SJA1105 require a
> > small pause in the TXC clock line to enable their internal tunable
> > delay line (TDL).
> 
> The SJA1105 has the problem, so i would expect it to be involved in
> the solution. Otherwise, how is this going to work for other MAC
> drivers?
> 
> Maybe you need to expose a common clock framework clock for the TXC
> clock line, which the SJA1105 can disable/enable? That then makes it
> clear what other MAC drivers need to do.
> 
>       Andrew
> 

The delicate nature of the SJA1105 bug is that as far as I understand,
the switch is not aware of the fact that its RGMII delay line went out
of whack. Its port MII status registers say that they're okay.

Also, if I understand Shenwei's workaround procedure, it deals more with
"prevention" than with "recovery". I'm not sure that (reliable) recovery
is possible. I'm trying to gather more data from NXP colleagues.
