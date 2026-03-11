Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331393C944D
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 10:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773224417; cv=none; b=hCfiHU5egrTYzhj3oT28JKI853Qj6/9EHz6FnvMz+rj7I8Z3SDyXqDKq42bsvKGpwKb+puplokJpzRvMzOflysHXYBtVnlW66xY1qSK0+qpqkQcGdWZ6sGdhizwh9rRqhTzxb6x98OeCHT7qtsr/rS99nO+1RB5Vcqcm6JNSqoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773224417; c=relaxed/simple;
	bh=xkVGs8l8PubkL8xufzDUaujd/gGM1mTvuLsQl9qCiQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E9wS8CI2PBt9Ob8qe2oaK0c41i/pCFO18m7f8pXatasOjsDlYOlyhndNPTl0AUZunqki3Zc371lkReM8PzqaIOmwAIRoM3mjVY6j2ysr5S3L8pO0kzoiRPwc/7viV5F+T+N/0lSEK11F8R0UG7oPX36HexdYVqC5LrkOONNnDBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C51921A28ED;
	Wed, 11 Mar 2026 11:20:07 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id AD0BF1A2908;
	Wed, 11 Mar 2026 11:20:07 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 9F43C202D1;
	Wed, 11 Mar 2026 11:20:06 +0100 (CET)
Date: Wed, 11 Mar 2026 11:20:07 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: NXP S32 Linux Team <s32@nxp.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	"David S. Miller" <davem@davemloft.net>, boon.khai.ng@altera.com,
	vladimir.oltean@nxp.com, Sascha Hauer <s.hauer@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	rmk+kernel@armlinux.org.uk, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Matthias Brugger <mbrugger@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Eric Dumazet <edumazet@google.com>, devicetree@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>,
	Chester Lin <chester62515@gmail.com>, imx@lists.linux.dev
Subject: Re: [PATCH v9 4/5] dt-bindings: net: nxp,s32-dwmac: Declare
 per-queue interrupts
Message-ID: <abFB1/uxq/ha5Bwm@lsv051416.swis.nl-cdc01.nxp.com>
References: <20260311-dwmac_multi_irq-v9-0-f0c03ef8d01f@oss.nxp.com>
 <20260311-dwmac_multi_irq-v9-4-f0c03ef8d01f@oss.nxp.com>
 <177322108829.2695119.13138199275449513148.robh@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177322108829.2695119.13138199275449513148.robh@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On Wed, Mar 11, 2026 at 04:24:48AM -0500, Rob Herring (Arm) wrote:
> 
> On Wed, 11 Mar 2026 08:53:59 +0100, Jan Petrous (OSS) wrote:
> > The DWMAC IP on NXP S32G/R SoCs has connected queue-based IRQ lines,
> > set them to allow using Multi-IRQ mode.
> > 
> > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > ---
> >  .../devicetree/bindings/net/nxp,s32-dwmac.yaml     | 47 +++++++++++++++++++---
> >  1 file changed, 42 insertions(+), 5 deletions(-)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml:57:7: [error] duplication of key "items" in mapping (key-duplicates)
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml: ignoring, error parsing file
> ./Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml:57:7: found duplicate key "items" with value "[]" (original value: "[]")
> make[2]: *** Deleting file 'Documentation/devicetree/bindings/net/nxp,s32-dwmac.example.dts'
> Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml:57:7: found duplicate key "items" with value "[]" (original value: "[]")
> make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/net/nxp,s32-dwmac.example.dts] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1597: dt_binding_check] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.kernel.org/project/devicetree/patch/20260311-dwmac_multi_irq-v9-4-f0c03ef8d01f@oss.nxp.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

Fixed in v10. Thanks Rob for review.

BR.
/Jan

