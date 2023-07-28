Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD76028F7
	for <imx@lists.linux.dev>; Fri, 28 Jul 2023 11:00:44 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-55acbe0c7e4so329252a12.0
        for <imx@lists.linux.dev>; Fri, 28 Jul 2023 04:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690542044; x=1691146844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAU8K3a8dHy/tuEIb7Zpcs7Yfdt1964yvfWu4jQqUuw=;
        b=UrIAf3FUSIv8YxPhfTK3nLv5IcWt5sxAS/MbAn3DuvkbIaHb7LD1g2rsl9yDEOwdSh
         3vY0iX48P3rU4dTxIJB9eIHtKllX7TF/TQCeOHzvgsz3cWjLPstf2rQNO1zJWaoQn/gT
         UDXJsAlFDdBYgpQbSjyavgIMkKIzTkwmiiGHFsWFrOlEcyrmWSTfsQa90rXEFhKycdx3
         sDsjhtBzBwTjeYOFc5jeJUg3L02N3lkPbPRcUAFljwl+lxlzHq8CKGg/m/bq7o/rlqbu
         fBbHr2TW9PfmJwxLS25qzOzPs3WbUxIe2YYi58UyCNVMDhLqbq9r2TYFdyq5zGHKFDSJ
         cKGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690542044; x=1691146844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAU8K3a8dHy/tuEIb7Zpcs7Yfdt1964yvfWu4jQqUuw=;
        b=Z4b4xYRMs+N+C7xQqdqurnDPG6cFJeySy39TbbkGOEoaIUNEzUb92XKh7DxN0fYy9d
         4Duv4QFOSob7Qcc91qQdOKFsP8K+f4d6Cxq1Uq8zYZGm69LupWBn+COR9t27txBHQbaW
         PfaldLj4RVfgQm5dygvysLrhn5lyLGhON0o7sAramu3N+BFwWvm2zqeBybNEpu3crHeX
         uuBwYbye6iSFv/WbRTSzt1YYry4rPoQbNMTpjJ610Np6WTIsP8KwEqawbcKP/diW/Oc1
         tLkq+a17wM5bo21AQmM26JWOkDGme9qncDPJqxYWkKCi9r12Ldu8VyTHyC4qtDrAnG3p
         DW1w==
X-Gm-Message-State: ABy/qLZvgvmhGr6BK/bg8StrCAtRLUc09MCrAsV22q+rJerZvazCQsyM
	T+y7U7AC79JA341xip4i1xSeq+v3F1TBTN8TfyU=
X-Google-Smtp-Source: APBJJlFRUaRTonS8rZhdy8awwpxcfDvB90VkuyRkJuU4rORotvPAMG3r669s1DgV5c8fsVRmEz9c48FJa+0b7z7329Q=
X-Received: by 2002:a17:90a:e4f:b0:267:f1dc:74ee with SMTP id
 p15-20020a17090a0e4f00b00267f1dc74eemr1975393pja.2.1690542044042; Fri, 28 Jul
 2023 04:00:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230727152503.2199550-1-shenwei.wang@nxp.com> <20230727152503.2199550-3-shenwei.wang@nxp.com>
In-Reply-To: <20230727152503.2199550-3-shenwei.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 28 Jul 2023 08:00:32 -0300
Message-ID: <CAOMZO5ANQmVbk_jy7qdVtzs3716FisT2c72W+3WZyu7FoAochw@mail.gmail.com>
Subject: Re: [PATCH v2 net 2/2] net: stmmac: dwmac-imx: pause the TXC clock in fixed-link
To: Shenwei Wang <shenwei.wang@nxp.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Simon Horman <simon.horman@corigine.com>, 
	Andrew Halaney <ahalaney@redhat.com>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Wong Vee Khee <veekhee@apple.com>, Revanth Kumar Uppala <ruppala@nvidia.com>, 
	Jochen Henneberg <jh@henneberg-systemdesign.com>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev, 
	Frank Li <frank.li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2023 at 12:25=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com=
> wrote:

>         struct plat_stmmacenet_data *plat_dat =3D priv;
> @@ -317,8 +359,11 @@ static int imx_dwmac_probe(struct platform_device *p=
dev)
>         plat_dat->exit =3D imx_dwmac_exit;
>         plat_dat->clks_config =3D imx_dwmac_clks_config;
>         plat_dat->fix_mac_speed =3D imx_dwmac_fix_speed;
> +       if (of_machine_is_compatible("fsl,imx93"))
> +               plat_dat->fix_mac_speed =3D imx_dwmac_fix_speed_mx93;

So you are forcing this on all imx93 boards, even if they don't use a SJA11=
05.

Andrew Lunn gave the following feedback in v1:

"The SJA1105 has the problem, so i would expect it to be involved in
the solution. Otherwise, how is this going to work for other MAC
drivers?

Maybe you need to expose a common clock framework clock for the TXC
clock line, which the SJA1105 can disable/enable? That then makes it
clear what other MAC drivers need to do."
