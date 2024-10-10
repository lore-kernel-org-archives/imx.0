Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A76B1CC886
	for <imx@lists.linux.dev>; Thu, 10 Oct 2024 15:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728574434; cv=none; b=Q7Um+pYEgQlsZnghUgTW1Y0rBnb486oXKXF1wJ6OsFlv3+xtt1co+dYwpguk1PyL2Y+1MXCjZydDiRoR9LpWrj20IcuKVsNyGDU19scK6a5tfCsN7iFI+Z08+84w1U2fv04d6duETIC4mzEKZmMCbeDeborI6xjys8ALSfJiWGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728574434; c=relaxed/simple;
	bh=dlxa8WkgVla/y46rnMys2EnNObaeLNp/NdzuivF7Pd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PfvooE1pSVWbTx8Ct8szkK1RPafYDM7QdXSB52QJSbrEF5RJU6uR/B9JHWo2PEcqFDKwujOKJYfU+7FuCpClR5oemulcyHNaEHoBH1y9Wj9HAUc9OAyvmU45ybbkvqXWHL+Re8SSgpnq94veHJsmrZToGw38xQPoi9Gog6T9tzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=IE0oEvRc; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="IE0oEvRc"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 32F3B40E021E;
	Thu, 10 Oct 2024 15:33:50 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id g5_EAXIcqA5L; Thu, 10 Oct 2024 15:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1728574425; bh=39uKMYCT3KgVkd7t9Lsq2trDmnvk6X8UkIGf6ni2s3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IE0oEvRcw/fymvusQ6smbGe9aC7VD/KGoZOlSrkR801eqGnvTbvr2DsGU6LwNvF9N
	 icMEnhv9+gOqKejIQf3Qy62RZreAFqfygkHuXJDHCHMzlaiP5LYhJohYKRS8Mg29Qo
	 bzpxiLs+3/u2WA4fiAuvaHZk2lt399iMQEdOwRlXgBG5Vm/8unHGfllvXV8SnN6r5N
	 Pj/85Gy0c5MllbXDLZkLb6OKdebErRjtFoahP5d/riBEWVoSRLgobRWNnv7SrPWXG3
	 po3Zqn4v/EI5XO++JdFqpYAbV5XASZ62iPyQu2vL88YFwl5tH7iACKkffsiNergudP
	 79FOsNy8Qo5Knzu0Q2oa2CIexOBcogmParbbbBp5twTotq/U1eTghtYkTsvB0/67fn
	 dt5sZcfqHAciIIPNFDnRwXZ7SuuLXr3qwApishqOt47xpjnZO8QeIjY80/BTRIzfeH
	 rzW2sp+jBas495rT2eyjnZRip3Jpt9TUEpzuKsfqYGf2sj5K0cGkc5cXXT5BnQ4wQL
	 29jHnxntodS0b4poIVB5FvOrQCVcLJ1FkY9DQUZqDmYbW5fY774TAm3mCvgLJtsJLy
	 WxpzoqDGdwmJFla0DsRpAYwxnzT2R0/vH6su9Q3p5NUtUI2rWvFUZGTmxX4/R242eE
	 Kaib41+hzx+f0kHe/k2gdCts=
Received: from zn.tnic (p5de8e8eb.dip0.t-ipconnect.de [93.232.232.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 18BD740E0163;
	Thu, 10 Oct 2024 15:33:26 +0000 (UTC)
Date: Thu, 10 Oct 2024 17:33:20 +0200
From: Borislav Petkov <bp@alien8.de>
To: Frank Li <Frank.Li@nxp.com>
Cc: York Sun <york.sun@nxp.com>, Tony Luck <tony.luck@intel.com>,
	James Morse <james.morse@arm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Robert Richter <rric@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/6] EDAC: fsl_ddr: Pass down fsl_mc_pdata in ddr_in32()
 and ddr_out32()
Message-ID: <20241010153320.GPZwfzwGeFF1cz4arw@fat_crate.local>
References: <20240709-imx95_edac-v1-0-3e9c146c1b01@nxp.com>
 <20240709-imx95_edac-v1-1-3e9c146c1b01@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240709-imx95_edac-v1-1-3e9c146c1b01@nxp.com>

On Tue, Jul 09, 2024 at 04:23:02PM -0400, Frank Li wrote:
Subject: Re: [PATCH 1/6] EDAC: fsl_ddr: Pass down fsl_mc_pdata in ddr_in32() and ddr_out32()

The subject prefixes in the EDAC subsystem have the following format:

"EDAC/driver: <Sentence starting with a capital letter"

> Pass down fsl_mc_data in help function ddr_in32() and ddr_out32() to
> prepare add iMX9 support. iMX9 have a little difference register layout.

Since everyone is using AI nowadays, you could have it verify your commit
messages. I did this:

| ChatGPT, Please verify and correct the grammar in this english text: "Pass
| down fsl_mc_data in help function ddr_in32() and ddr_out32() to prepare add
| iMX9 support. iMX9 have a little difference register layout."

It replied with:

| "Pass down fsl_mc_data in the helper functions ddr_in32() and ddr_out32() to
| prepare for adding iMX9 support. The iMX9 has a slightly different register
| layout."
| 
| Changes made:
| 1. "help function" changed to "helper functions" for clarity.
| 
| 2. "prepare add iMX9 support" changed to "prepare for adding iMX9 support" for
|    grammatical correctness.
| 
| 3. "iMX9 have a little difference register layout" changed to "The iMX9 has
|    a slightly different register layout" for subject-verb agreement and
|    smoother phrasing.

And this all looks good to me.

With all the cringe we all get from AI, I think it is very useful for
verifying commit messages.

Do that for all your commit messages pls.

Thx.

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/edac/fsl_ddr_edac.c | 62 ++++++++++++++++++++++++---------------------
>  1 file changed, 33 insertions(+), 29 deletions(-)

How did you test these patches of yours?

They don't even build!

drivers/edac/fsl_ddr_edac.c: In function 'fsl_mc_err_probe':
drivers/edac/fsl_ddr_edac.c:538:21: error: too few arguments to function 'ddr_in32'
  538 |         sdram_ctl = ddr_in32(pdata->mc_vbase + FSL_MC_DDR_SDRAM_CFG);
      |                     ^~~~~~~~
drivers/edac/fsl_ddr_edac.c:38:19: note: declared here
   38 | static inline u32 ddr_in32(struct fsl_mc_pdata *pdata, unsigned int off)
      |                   ^~~~~~~~
make[4]: *** [scripts/Makefile.build:229: drivers/edac/fsl_ddr_edac.o] Error 1
make[3]: *** [scripts/Makefile.build:478: drivers/edac] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [scripts/Makefile.build:478: drivers] Error 2
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/mnt/kernel/kernel/2nd/linux/Makefile:1936: .] Error 2
make: *** [Makefile:224: __sub-make] Error 2

Before you submit next time, build-test *every* *single* patch of yours and
test the driver with all of them.

This should not ever happen in submission.

Stopping review here.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
