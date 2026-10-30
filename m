Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349293;
	b=35rusI8g5CUSuM0eVMg6flHKseimG5W305d8FdDMaQIM1z3Xcjo3lSoXIM1l9erMS5ps
	 FQZCrI3rwWrjnhOHpH7W4zDzG8zhvyenPHcV1T6hcZ6qPCEbUVWQDsXt5XNvE2m9bDgwd
	 cL62IMn9uiS4gT2UxK+qsU2uG6SPtNI8n0F2hE+7HNeG12IPPPQKGQ8rU0Qf8l31QhYh0
	 US/9uxTsN7X2e1Y/j8/pl/x59boGgiCytchDXfjC3XmFfAq9di+GkwXSTgrhuigHHDBYp
	 4pYT83+cYUC4S3kfXlOPXh+xaq7SDVAwBKkmBf1bZIcfDDHqj7S/SBWdLjjE1ooWqSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349293;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VQsxK0ypjps04yXtP7D9Vl+v3TvG2zuYW8obCp7EWXY=;
	b=NOCHLPgFGkQ391oBCZQbrZYJBFEMOxpooKvn40GtfTcccsqekZXpGToiTwDtbO6WIYf9
	 kj0lCVWL0gNuSC5nJOIIyFd+boMa8ewxwMsgBmC9AXV3TRr1xPv0zZhDoQWmAOBrU8Joa
	 9lL//nApafSWnGNtaIig7cDMh+SsIT01meuyOUeemrUw68FZtbJizn8cQhPQZKmgj64a1
	 JuNV+eVDGsbGgGUtRjoT228jocZX8NxmvzffSHfHOC9m2KN4T6lw47FbsiqX0Uu4UzsT+
	 MO1TgrI6SAwWsVDOm1NGO1f5MZLnIsVIuvFo/GzIS9dzOyWiPRPGQBfrM/7MjcIygyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZINXWUPL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD949606A321
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 08:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZINXWUPL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7588C1F00A1E
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 08:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793349292;
	bh=VQsxK0ypjps04yXtP7D9Vl+v3TvG2zuYW8obCp7EWXY=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=ZINXWUPL8f7LzBGYW2E2EFIN5YqikTTIb6zwoXh3U6y5TI8TyVghqJOnoO2wsfn36
	 moX34gngLXCKOjeWefU2mX1XvRbWDQtwavmxT0cPBm/KX1wuvozwQlohjO4uD03q1T
	 uI2V+vypbS7nGXA4PT4H+cAxO3NZUAaMdTxdvkxOjKlmHIjFI2TnPW/0/wdwbQZW5j
	 d7KGRB6+Vjvd/v0UuejTd3Lu3zI+3BJqDMtUXig8OO6VM/BJ2YLRVUjIc0IreFrqw5
	 zzbeJ+8dS3RPR4aushFL2zDJmRGC1cKBllkHlI7TGpc5S9FoZ2bv+7oL9sZ6Wf/XCC
	 93y/wQ0ypmeww==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a98fc80925so6543811fa.0
        for <imx@lists.linux.dev>; Fri, 30 Oct 2026 01:34:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwu2IOQlA1Y7hqVQrzZeOX04ZYyrDWHcHr39gUhkWXgmiI+sBkRdCtt5wCXLusdLoxdT9E=@lists.linux.dev
X-Gm-Message-State: AFq9FYKRbss5UaiqUSp+4iKUyp0mFXC18KYZpC9dATkuv0OdOG5ExxjU
	Qk6thROrPdNGFIffd4pd8dW7XOP5G7eqgCu7yvNy820fKfOdiYiEiV/chcCRA0QwzIO5RCX0s7f
	W+YdBCNS4kigKuQaCqpkMlqy1TjEbTRU=
X-Received: by 2002:a2e:be89:0:b0:3a9:a1ed:6341 with SMTP id
 38308e7fff4ca-3acb7ac0796mr3395761fa.11.1793349290657; Fri, 30 Oct 2026
 01:34:50 -0700 (PDT)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 30 Oct 2026 16:34:37 +0800
X-Gmail-Original-Message-ID: <CAGb2v66Ya50=++STiOLihh6VKtb00QYcv4ARAWqFQ=1FML0Ccw@mail.gmail.com>
X-Gm-Features: AclHuK8f9aQow26btBoDKktg4w5d9q6uuVMy592vvuptaUTTeNrSAFWXrHhABVQ
Message-ID: <CAGb2v66Ya50=++STiOLihh6VKtb00QYcv4ARAWqFQ=1FML0Ccw@mail.gmail.com>
Subject: Re: [PATCH 1/2] mfd: Constify mfd_cell arrays
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Thomas Richard <thomas.richard@bootlin.com>, 
	Andy Shevchenko <andy@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Andreas Werner <andreas.werner@men.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 3:12=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> mfd_add_devices() takes pointer to const, so 'struct mfd_cell' arrays
> can be constified whenever driver does not modify it in the probe.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/mfd/ac100.c                   | 2 +-
>  drivers/mfd/axp20x.c                  | 4 ++--

Acked-by: Chen-Yu Tsai <wens@kernel.org> # ac100 & axp20x
