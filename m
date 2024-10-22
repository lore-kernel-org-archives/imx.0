Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7A8142E83
	for <imx@lists.linux.dev>; Tue, 22 Oct 2024 06:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729579589; cv=none; b=aXC4rTyfzi5qlF/Q984XYtOV73LLPVKjXppadE+GfvVru6hPnytZqU7XvpSgm7CNOusLTK7iaW/UGm+vKi1TfMbn+vE6FeDMOC/Z+FJJ7wiS75QYTi4yAJ/mT15CKil2rH/48pdnglEUZRS5zNNmPdOmgZDBK/F1zYCeAtO6fZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729579589; c=relaxed/simple;
	bh=Khj87fNVKU3GsuLBvh0Aq9O2v3YB1Pzl/kVwuafwiSI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sutGvsOBj+rWUQP38IWjRGzMxVoqKxFQDv+hpd01lJsvdvkGFJ7st0Tw0h81e1zTMza2rByco+Wy3zCvNAgKqiMbuEUjSKexm6dh4gW0yIVbNSNv2KCfrMQ4LNvF0HiSsGSkMIwxActYXmhu8z6dluA3EtVFiqkteq7oqcnyJqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=cF5FV/w1; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="cF5FV/w1"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1t38ev-00A5eT-1g
	for imx@lists.linux.dev;
	Tue, 22 Oct 2024 08:46:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=OFvkNSOe6E5Pxsw9UfnAUjaYsSKQZWEKW1KouM5WGco=; b=cF5FV/w1+qVf44qS7mDbBCLr5G
	hV0kVprJAGZbEd3gHMZk2itdTKV6fY4sVjnRRG+ctuvnFk5QBOcJYMJnZrT6LnWK3+/Uep9INQwy5
	VU/c6OKbBof0Z/PFOGj5MLPqJJkW8MNr9BRL8//UlyvU4Gx6uBsga7R77/7xTE4MiZJCFrMIw9TeQ
	2ZL3dZYIxHBvKc1aDsGCe0/BRz4YwVE/vtzwNJ6D+TTzqmRjCT6cZOqIJ0Kc2PZ1fFmEKuZYwr2Ho
	44ZIGNG4kpSQy6eow+Mxdqk7Lt5GLiXpl4XGJ+DluMyiKzlHJMDEMPjdVMS8wv7LxSQDZmqqMCQPw
	jD2+U9kw==;
Date: Tue, 22 Oct 2024 08:46:13 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: imx6sll: fix anatop thermal dtbs_check
 warnings
Message-ID: <20241022084613.5d126c01@akair>
In-Reply-To: <ZxcdYudAHVSykFoW@dragon>
References: <20241021183244.303329-1-andreas@kemnade.info>
	<ZxcdYudAHVSykFoW@dragon>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Tue, 22 Oct 2024 11:34:58 +0800
schrieb Shawn Guo <shawnguo2@yeah.net>:

> On Mon, Oct 21, 2024 at 08:32:44PM +0200, Andreas Kemnade wrote:
> > Fix anatop thermal related dtbs_check warnings about node name  
> 
> Can we be clear what the warning about the node name is, too long?
> 
soc/imx/fsl,imx-anatop.yaml explicitely specifies the names of
allowed subnodes and mandates the name tempmon.

Regards,
Andreas
