Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBA22F3C22
	for <imx@lists.linux.dev>; Wed, 13 Aug 2025 09:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755079031; cv=none; b=oCZr4rMmvXJgqiWg/mJALmxTO2bPWkW/fNvWtUtMFJErPTbFLhbQgROrFR3yb/QQhYA4JHOL6/yheAOSUhsWRnpuf3z6Kq/aHyIqGs3mMbTKKufjG+/UxIe3pIN/Nvcmi54t+rcJXQP8VYuPjs0KPci3bdFF0TYNpOTw3WYz5sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755079031; c=relaxed/simple;
	bh=3I/mDqpQX9jkLpLoehB+o2RmLvW1cxiRLz6+Er4xFOE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W3UOjI3cBAn1QU5lVhc/c3wG2hBdhX+38q3C2VYcwX7eHpjv25ex9BE9EsqcnU1mCkYuDwJ+k9r2wPLF2/R7SDHzIUHy+s/YMZvPFN/nizKhaWuHI10Ern4Bt0pkEsAtJkhujl9bR6udPT0M4VU7XHIGJ1u4moIWybap8q8Sd4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=rPxck3uV; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="rPxck3uV"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4c23gc147Gz9tHg;
	Wed, 13 Aug 2025 11:57:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755079020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3I/mDqpQX9jkLpLoehB+o2RmLvW1cxiRLz6+Er4xFOE=;
	b=rPxck3uVjGwVbjegnyQf978gzo+AChZ920JmecucA/mfRWGtJP/WQrT4CZ4rISo0Z5SfTb
	7xbZL8h7b+hIab2dIR7MXaDX6HpxJCouTG2Q0ACtD0/XYRCewrARcji9s7L64Ke7qTWDPt
	INm9fhWFk18EwwsxU9o53TNNEG5E4mAyRlC6tohqirDigkOtmYQpbsLWEpmPnIT8NjLcPm
	mcnfTTl0qZLpmmcQj5+eYBnAPiBoSsBsvNCFP0qzQw40jogFJz7GeluVyJ/lHg489NnlQ7
	iLlcRYa9uDRtK+NB62kdSCLvam2gG6Fi+UqF7HLlXbc55DXrMHY3joUawW/Teg==
Date: Wed, 13 Aug 2025 11:56:55 +0200
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukasz.majewski@mailbox.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: =?UTF-8?B?Q3PDs2vDoXM=?= Bence <csokas.bence@prolan.hu>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: imx6-display5: Replace license text comment
 with SPDX identifier
Message-ID: <20250813115646.29a08c1c@wsk>
In-Reply-To: <eac01571-13cb-44a8-b724-76e1b2af4c0b@kernel.org>
References: <20250709-display5-dts-lic-v1-1-81e46a650d3d@prolan.hu>
	<d9e81ff2-5621-49db-92a1-acf304b225f8@prolan.hu>
	<eac01571-13cb-44a8-b724-76e1b2af4c0b@kernel.org>
Organization: mailbox.org
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MBO-RS-ID: c13e5f5f6dd64ce9ace
X-MBO-RS-META: sowtjo94ijj8df1d4gp6ww9koodhgx4h

On Wed, 13 Aug 2025 10:33:32 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 13/08/2025 10:29, Cs=C3=B3k=C3=A1s Bence wrote:
> > Hi,
> >=20
> > On 2025. 07. 09. 9:32, Bence Cs=C3=B3k=C3=A1s wrote: =20
> >> Replace verbatim license text with a `SPDX-License-Identifier`.
> >>
> >> The comment header mis-attributes this license to be "X11", but the
> >> license text does not include the last line "Except as contained
> >> in this notice, the name of the X Consortium shall not be used in
> >> advertising or otherwise to promote the sale, use or other
> >> dealings in this Software without prior written authorization from
> >> the X Consortium.". Therefore, this license is actually equivalent
> >> to the SPDX "MIT" license (confirmed by text diffing).
> >>
> >> Cc: Lukasz Majewski <lukma@denx.de>
> >> Signed-off-by: Bence Cs=C3=B3k=C3=A1s <csokas.bence@prolan.hu> =20
> >=20
> > So, what do you all think, is this patch acceptable? =20
>=20
> Yes, you just need Acks from all contributors there.
>=20

Acked-by: Lukasz Majewski <lukma@denx.de>

> Best regards,
> Krzysztof



--=20
Best regards,

=C5=81ukasz Majewski

