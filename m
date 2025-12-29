Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C831A1ACEDF;
	Mon, 29 Dec 2025 02:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766976155; cv=none; b=q3hiW/DufyL6uyQ9+9fE/3Wdv8T6kAqIGyqgLa4SFT4m4i4SK+L8CEdFF7o7eIkFMqOhsLskIOYD8raeMBKExC5NRe2C5WfIfmvYo7iLBkbv7A4MGvkb/cWFFgtppxAxFmfhQ1mD/fVpn+hLzMHS913Ik1gAxjrdGccQb6eVqHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766976155; c=relaxed/simple;
	bh=VfX8cZ299Fd2aqfB00CG/8JVQnNZFXjsOP4N8336/Rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QTqvZxmwRnImCRgWJh1CL1BC0xVUVQD7+Zkuy6cGsjRPfF3ThsGaZasGwCtky1fn2gcac2q1OjhE/KRY8en4LLWL9t/fQPigyFQmRfgsoksODvznlPzgCzfA3RQ5fB66Xki4N8g59MMCxnk+CKYf0Qf+m3++VGj4PI3SxABDXbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NdeNYSvr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NdeNYSvr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE55C4CEFB;
	Mon, 29 Dec 2025 02:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766976155;
	bh=VfX8cZ299Fd2aqfB00CG/8JVQnNZFXjsOP4N8336/Rk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NdeNYSvrLyMlPEcBO36rbv2dxeNZXCaHMW4Tz47KdN74ohVVlLMKKuZLsyLWVzwvd
	 ShEnhqNA8MlLJUNgJtUQ8p5ltCN1KzBm+5WdtdWsJ4WBrdjFRhIvAipg9r4bFaA5QS
	 E2AfLyDbBXuPKLbceiU8td5jpciPXpK8tm2n4iWFNnlKtvwRPjiz25bGrHT3KvLRuX
	 et8A/qo7M6/x7bbHOq3w4qkmVILxLooUGD5BB8Ci4iNHyZzMM+FCxjJ4wP/Q3AGG19
	 pgDEsLewoNuUXOrIWx3RtQi9NvJ71p6HWjkievkEqT2T8dAf4IRPg0QToaJrJjTTX0
	 SMF3PP//eLmTQ==
Date: Mon, 29 Dec 2025 10:42:30 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH] arm64: dts: imx8mp: Update Data Modul i.MX8M Plus eDM
 SBC DT to rev.903
Message-ID: <aVHqlnNGNGmaF14m@dragon>
References: <20241226171404.84095-1-marex@denx.de>
 <173531253398.3886481.9345779510218290682.robh@kernel.org>
 <14c48d93-8ee6-4769-8dc3-5c527134bc77@mailbox.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14c48d93-8ee6-4769-8dc3-5c527134bc77@mailbox.org>

On Fri, Dec 26, 2025 at 11:24:29AM +0100, Marek Vasut wrote:
> On 12/27/24 4:18 PM, Rob Herring (Arm) wrote:
> 
> Hello Shawn,
> 
> > On Thu, 26 Dec 2024 18:13:27 +0100, Marek Vasut wrote:
> > > Update the DT to match newest Data Modul i.MX8M Plus eDM SBC rev.903
> > > board which implements significant changes. Keep some of the rev.900
> > > and rev.902 nodes in the DT so that a DTO can be used to support old
> > > rev.900 and rev.902 boards easily.
> 
> [...]
> 
> > arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: tpm@2e: compatible: 'oneOf' conditional failed, one must be fixed:
> > 	['st,st33tphf2ei2c', 'tcg,tpm-tis-i2c'] is too long
> > 	'st,st33tphf2ei2c' is not one of ['infineon,slb9673', 'nuvoton,npct75x', 'st,st33ktpm2xi2c']
> 
> This is addressed in bindings patch [1] . Can this patch and the bindings
> patch be applied ?
> 
> https://lore.kernel.org/all/20241226171124.83735-1-marex@denx.de/

Could you resend them?

Shawn
