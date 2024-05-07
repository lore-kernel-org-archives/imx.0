Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395A413C825
	for <imx@lists.linux.dev>; Tue,  7 May 2024 08:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715069030; cv=none; b=gRiMSc/YFHfBEHOOdmw84vEx29QmrbNsAK65l4MkqcXLWHdloH4+2PjPqnw/6mr27t9VsJQx2UzQWw9a7pVm2f1qBuwUmRniH3f0TKvpRj/Ea6hPNG1bmQAEci+13AKLyK85TprhgLX14TQJXcDhWCTqili605wcWM5dszhjhxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715069030; c=relaxed/simple;
	bh=dckxDuJXcTS8FcNV2HMCeT3R5Pxpcf+5RPhmyxTdlqU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PrxgZ9xjPhkCUUkeEOigfhRs01OIJsZGGjdDvrSFyf62TmVNu6M7CzVMrxE1xpzCg7x/1oWgjLirH6QbBEVa3YznzGIBzw7YY1pS6uFFMI9I3079atRJFtF6j27zeztReFFWr3mSXeLwR48YzYMg05Et4BaMNoTeJxsUkZ+r9lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LXUiuorg; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LXUiuorg"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 77983FF811;
	Tue,  7 May 2024 08:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715069021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3stVzcSl81pEJNONxNBwP2g/IfGB0kfIKSg1nsdNyhA=;
	b=LXUiuorgxAxO5DbieuICsybsdUR95Ht6Gu8+Tx2dG5iJjSPYpqsTCk2IxU5sBridjlOADl
	lCCWm9yo8a+q+MrSiqnUc6RPBkO8AFTqObAc9npdia6HpNvlNi1ETOK1WwnnWuXtyOyfzf
	u/7xb80U6YxZa8/M0HDwBtyK0DKBrkHAORY+l6GgaKB+V6aQE9wkV+VV4NmuCBCsPMODHH
	nbg6+SBiLw9rYZMGZ3A+un9LO2BuGk5Ovt4kxRsZEU7PH7GkKgxd5AqDfw9epOvABnFx3N
	tH00XS/S94VG/PSyhxKHOQgJmLvCRffhWWstdiutPT6Z6M9/9tWGMIUcK92wsg==
Date: Tue, 7 May 2024 10:03:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] i3c: master: svc: change ENXIO to EAGAIN when
 IBI occurs during start frame
Message-ID: <20240507100340.674f9acc@xps-13>
In-Reply-To: <20240506164009.21375-2-Frank.Li@nxp.com>
References: <20240506164009.21375-1-Frank.Li@nxp.com>
	<20240506164009.21375-2-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Frank,

Frank.Li@nxp.com wrote on Mon,  6 May 2024 12:40:08 -0400:

> svc_i3c_master_xfer() returns error ENXIO if an In-Band Interrupt (IBI)
> occurs when the host starts the frame.
>=20
> Change error code to EAGAIN to inform the client driver that this
> situation has occurred and to try again sometime later.
>=20
> Fixes: 5e5e3c92e748 ("i3c: master: svc: fix wrong data return when IBI ha=
ppen during start frame")
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>


Thanks,
Miqu=C3=A8l
