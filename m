Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4834921ABB1
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 04:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787544383; cv=none; b=aC8gdgq7IQg62DXVMB3WBrBphJEBePX5kmjR5Vz8FiZhQ4agIPIyezi2Ldd9jZF7YhjWj387MyI18JVWJj65IK2Za3YNA5yPj+Kh9a4iBmQlS9kQZmbjdK2a16TeoVzXHLlcZG3h15e9liI21x6v+wiHo38HklDVtk08IKKDrT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787544383; c=relaxed/simple;
	bh=exbFruRfa5/z+uGWp84fkhkOcBsK93Ejj4V0SsqYGRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=md/al93l2ylWEsECiw12Rw4Xe0HaJ3aPHP4+Madz3W0ALVORi72xOJ+9tk84HrIDc6/Mu9Seh0TQ27gMSkQXCwjv8Iv97mP/SpS4c1JpkFGU7lJtG0ulnbql/Cr6HFJzlPN2qsKK+lZJTRAj0rA5VBuiuXpEx20vlEgf6PGxw7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bhO82kbl; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bhO82kbl"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-848643382fcso2938869b3a.1
        for <imx@lists.linux.dev>; Sun, 23 Aug 2026 21:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787544381; x=1788149181; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aZ+YAW/hXFppA4FxL5IflpWDS7HfTYg8qTJoBoXjwNs=;
        b=bhO82kblPHhs/jNlutaEd2dOwp9X8cCX7Cz9rPoxhrlYZzKHwbOyud+UMUqjWB2P8x
         oG+Y9qsjANPwWaZhJehglwNjm0adEPPtLq1X6BxRcxB/Ltpxh4vZp5F6M8O//MjCbGu2
         PqQ4TH/RtXR1xbb6dKJcxxi3dZmAMo3guRgec2yXDhNaRhCNXlYzT6g3tDmKXzHxnBo8
         mMIcFMRIrlpY6AsFETvLMyTZuU6WEIrIJ/GmUB5Kcy00dFt+WDb0BNO7/d5AHfpHocWK
         5M8TrLqqAQ2B88ZUSX6DVTxNvO/FoxtCnM61Z4f7zioZ9tW+XH0LbJ66nQknUVZkrsYe
         RUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787544381; x=1788149181;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aZ+YAW/hXFppA4FxL5IflpWDS7HfTYg8qTJoBoXjwNs=;
        b=VQt0fJ/lLDLMtoMcmTwllo7EDSsSeWxWJcHRBra4wxVXp/1HaqK/DXBJ7ZmL9jt8rS
         cTRGymvzFo0jgERDMON1koWjnQfGR7UAY0eqIbim2hj8pADivOv2vBDks+5M5UPskT9L
         bLCyUWv6SFyqV6sQauig98fgcZRIiSFJeC2BypC7DZtfMvdvo3SDl0/VcQt9BhsOpPLd
         BupypcNW4KaU9G2t26f02gaCFsg6OPW2tJy3c/ACoznz3cwqzZvQPtHYugpreQ8+jv0a
         DbTjdJN28t31oIQQTKlI7CYMnmsxfrHs3QlLRnljGCtfe4J+PPCk5IwuwgOfZJSmmGu8
         X+Lw==
X-Forwarded-Encrypted: i=1; AHgh+RonIJWAteRq0xZG0dyTo+k1AVxYtYp5hCNOfsvzUdMC2ZyIUi0OdiliWGwQuRB4odDf4/w=@lists.linux.dev
X-Gm-Message-State: AFuF++n4GHknfPvql9sG1Z1fnEHg+q/+1+J6FrEsN3Iy59LZYM1QWMg/
	FKBCEZYjqfBBs40vGM+YViZPADP+ln6FpSCGlN05iT/4/eQOw0i1AVOUt33vTDW4+Xk=
X-Gm-Gg: AR+sD10FWOgTW1quozOXWbrENzdt8mkd7sC30emHymj17poA7jfXB5en/Z5IyC/Wdnn
	qVdqV4ZYLrZtvaSjMZnnrsP26cuADCzn9XQu81DVjifgBpufV78x4C3PpHHxdrQFZDw9wbbMgXZ
	lsiMBBJjKn4deyVzBn78HN5nwqnjTb8QH2dofo2K5PVuhYvk+iiDxLe9td63fP7u4Ib/smHUMNI
	If+GT3pPq1Kbs+WfUrPGUNXfkM31dPWktPEM52wwiIywvRWb6Ifc0xwpnhaf83b8rEIf39XFm4y
	S7S1GSlf6B+jFsNyBZuydc935VwYaYkZ6tE+edWgHG889iaqkpxJT//ae7/1lZizcSDQnx5Qs+4
	OceDF9PhzU9x8hFSNYa0lTEEeF1Hka/JunfrYQ+e3Q+MWicfLUEqOnGU/CiRlYhBr8V730cmkec
	U2gfjWwcUcofatNyqdwsaIFOHR9ZAZjGneIZFqZeOPtPByWsY3MGafB1U2vOq3CZs=
X-Received: by 2002:a05:6a20:7288:b0:3c3:6b6e:8ba0 with SMTP id adf61e73a8af0-3cd3008a6f1mr36995990637.11.1787544381391;
        Sun, 23 Aug 2026 21:06:21 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1418619d6ecsm19733419c88.14.2026.08.23.21.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 21:06:20 -0700 (PDT)
Date: Mon, 24 Aug 2026 09:36:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Linus Walleij <linusw@kernel.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	David Lechner <david@lechnology.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>, Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 33/45] clk: spear: Make sure clk_init_data is fully
 initialized
Message-ID: <aovDOSMKhHLI70dW@vireshk-B250M-D3H>
References: <cover.1787239813.git.geert+renesas@glider.be>
 <d4500d249021013d52aa87407f875dc203a251df.1787239813.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4500d249021013d52aa87407f875dc203a251df.1787239813.git.geert+renesas@glider.be>

On 21-08-26, 10:53, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Compile-tested only.
> ---
>  drivers/clk/spear/clk-aux-synth.c  | 2 +-
>  drivers/clk/spear/clk-frac-synth.c | 2 +-
>  drivers/clk/spear/clk-gpt-synth.c  | 2 +-
>  drivers/clk/spear/clk-vco-pll.c    | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
