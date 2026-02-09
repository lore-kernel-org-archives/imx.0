Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6772E1722
	for <imx@lists.linux.dev>; Mon,  9 Feb 2026 07:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770623411; cv=none; b=tpTTN1FuxVtOYLAA9oJUwWQoRdVnpFKUJUVxxdUvQ/4h1F3M9O1xsT1kCIPCDnZW5r8e1W+i8eiLl6uFSTfYZXf5aKEhE/T8r9S4nx3ztGVYGtuQ9FKFCQjnLOUiXQPepq76B779Q57NngT5QNhFtcmYIQaJSbu1KsYGopODVhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770623411; c=relaxed/simple;
	bh=AeJAKV0Jk789dxUWjf3juEDJa2rKx2DrVjSPZziDCjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZXszjHeRN3JdgCTE2vG2IpGCpSmucAQPqQl5kL523rvtJbNU+0YbiwfSLtyzDX+YrUHGAZ6v+GZsyapePYAVGv3Zu5/UUA7BEQuNYaOx1Vc82wcf63aDbwCektlU/yfW/tjGJP3ev1sRhkiNJ2sbz0iDpR+daroT1iWcuxl4lHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CD0741A28E0;
	Mon,  9 Feb 2026 08:50:09 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9EDBA1A0488;
	Mon,  9 Feb 2026 08:50:09 +0100 (CET)
Received: from lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com [10.52.9.11])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 49576180029D;
	Mon,  9 Feb 2026 15:50:07 +0800 (+08)
Date: Mon, 9 Feb 2026 16:50:06 +0900
From: Yanan Yang <yanan.yang@nxp.com>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, qijian.guo@nxp.com,
	justin.jiang@nxp.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Daniel Baluta <daniel.baluta@nxp.com>, Lei Xu <lei.xu@nxp.com>,
	Xiaofeng Wei <xiaofeng.wei@nxp.com>
Subject: Re: [PATCH v4 0/2] Add NXP FRDM-IMX91S board support
Message-ID: <aYmRrjbvlrPylSei@lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com>
References: <20260123-imx91s-frdm-v4-0-1bab038faee9@nxp.com>
 <CAEnQRZBBM6y9Ux8ytbYEY-hQ_D8t+aW1+8OczUpX4=p1gmxVQA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEnQRZBBM6y9Ux8ytbYEY-hQ_D8t+aW1+8OczUpX4=p1gmxVQA@mail.gmail.com>
X-Virus-Scanned: ClamAV using ClamSMTP

On Thu, Feb 05, 2026 at 03:41:57PM +0200, Daniel Baluta wrote:
> On Fri, Jan 23, 2026 at 8:43 AM Yanan Yang <yanan.yang@nxp.com> wrote:
> >
> > This patch set introduces DeviceTree support for the NXP FRDM-IMX91S
> > development board based on the i.MX91 SoC. FRDM-IMX91S is a cost-optimized
> > variant of FRDM-IMX91 and differs in several hardware aspects:
> >
> > - 512MB LPDDR4 (FRDM-IMX91 uses 1GB)
> > - 256MB FlexSPI-NAND (FRDM-IMX91 uses 8GB eMMC)
> > - Single GbE port (FRDM-IMX91 has dual GbE)
> > - PMIC PF9453 (FRDM-IMX91 uses PCA9451A)
> >
> > This patch has been tested on FRDM-IMX91S board and verified for basic
> > functionality.
> >
> > For more details about the FRDM-IMX91S board, see:
> > https://www.nxp.com/design/design-center/development-boards-and-designs/FRDM-IMX91S
> 
> 
> Hi Yanan,
> 
> Just got my imx91S frdm board and tried to test this but the patches
> failed to apply on linux-next.
> 
> Can you please try rebase and resend?
> 
> Thanks,
> Daniel.

Sure, will fix it in v5, thanks
