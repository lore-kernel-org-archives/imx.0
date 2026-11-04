Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793776389;
	b=0PQSbkE+VYHq46mXxELe8uf/uDT1Gdk/We84PTwKR+ON+1VvJnL6uZtbeijuneGZjjiz
	 5FAyO8VjOCIi45ivZWE9r5CMRzq2sIfWsYoTTv24QpQleMOYgoapTxezLGk71bspCequa
	 U0dnRPNtwSDQJ0lxrjsaaEw3TM3DfezNNyfHIOJ+HVDhRlzdIVKmAhDczFDu4mS1FQRnF
	 0HFLk5WDHEDuFMigF8dXiu98TZVe58Z5N/BjZXaIpmUdIC9vb0ox0Jmg1FixIcXty+rpu
	 gwugUhWrx2mQJ2FZKAvC7jI8NgNBLmmo3oqNGkQrbtX4EQAtdsHB6AMRu2N34Z03IWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776389;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Y1twZ2GXIDrX1DyCELXWktIRabO9Q3G/1/nbruvB7Oo=;
	b=vGt6FPLo5cWQVGLV/Pe3qLskUPQEUPX/6AHoPPG5rWjUy64rN8vJQTSTc5JEg1Q+0Vzv
	 zkGjf63gd2OO58xae3s/fiLrDL20DqPm4ew0OWy0BxYzwywdZqCUh25QAaYDhp+vG5qx9
	 FSE6s6pO6syFK4emMYN4t/gZxwV0hjX0Wm69uJNXZ+MxQ/T6WAg+HiVxgAROpFMzYaGVp
	 oRbvwmvgziEHRE1epJD14fMJS9T67NGVFujKgSig7famEDFzIu8cEGCkDB92APh4WxRLr
	 uoL6pqLc6AtbLY4HVo8XIXcy1HNd5pFtA5ARC94iKL7ayLk+Fest+ciePeKuvppCsvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fkmIsroz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94B2606A31B
	for <imx@lists.linux.dev>; Wed,  4 Nov 2026 07:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fkmIsroz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B41921F000C1;
	Wed,  4 Nov 2026 07:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776388;
	bh=Y1twZ2GXIDrX1DyCELXWktIRabO9Q3G/1/nbruvB7Oo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fkmIsroz8SPVEqCrxugLC3r71DIbzmk0gqEpl07FpSOxGll0iqJDArIh7Po5IJTGR
	 lxcefe1IsOE8kEZ+lC3Poc/qvrZ6MtNZwnLrmJZ9q1AfqPB5P7rK18IykLGk3V2syR
	 hre9sJtKw53unli23pLe+5W87DV4deQNED36phDNuwUW2EnSp9LVew+jdp3cCyoRh7
	 BPuko4p6n7PKvPCj+wCs+91GqeCUMu5nufF73ixcxYgQOJnWkJlQABPaog35LJKTxm
	 X27peuFFDAg4sB/vX0un4fCIOJ29QwzD/v9xMT1JU2PXXLzT0ktfmAigXOzTUJ6C0V
	 uPifXJP6vPiVg==
Date: Wed, 4 Nov 2026 08:13:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-arm-kernel@lists.infradead.org, 
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH] soc: imx8m: drop the clock reference if enabling it fails
Message-ID: <20261104-small-pompous-basilisk-ac9df8@quoll>
References: <20261104021429.1468237-1-vulab@iscas.ac.cn>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261104021429.1468237-1-vulab@iscas.ac.cn>


On Wed, 04 Nov 2026 02:14:29 +0000, Wentao Liang wrote:
> imx8m_soc_prepare() gets the OCOTP clock with of_clk_get_by_name() and
> releases the register mapping when clk_prepare_enable() fails, but the
> clock reference itself is left behind.  imx8m_soc_unprepare() only runs
> on the success path of imx8m_soc_probe(), so the reference is never
> dropped when the clock cannot be enabled.
> 
> Put the clock before jumping to the error label.
> 
> Fixes: f6ef3d9ff812 ("soc: imx8m: Fix error handling for clk_prepare_enable()")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/soc/imx/soc-imx8m.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Multiple things here:
1. Your team ignored completely previous feedback. Multiple times.

2. You use multiple identities with this email address, thus I doubt that we
   speak with an actual person.

3. Your bot does not even bother running checkpatch, right?

4. Nothing of this was reproduced nor tested.

5. Finally, the same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document the issue discovery method and what was
or was not tested.

Best regards,
Krzysztof




