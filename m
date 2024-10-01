Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A451CDFD7
	for <imx@lists.linux.dev>; Tue,  1 Oct 2024 20:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727813598; cv=none; b=qyDtDOped+bmyB6BQtjcmMTJWxA3b8CMe1Mc8PVO2jq55Q1vuuhZIRkn60K+j+WNnlbRlaJUgZzuKNSRgTv3mwDdyTQK8AT67cNF8wsKdn7F2YNUm/DOU2uw6xA3dAp1CcPrenRqVV4eny7piG7z2smv3YAqe22f/5zJ6PevxfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727813598; c=relaxed/simple;
	bh=KnKZYbEikk3xZI7gKm9ZgpIsdiL1FXE8DWWLSpCufZE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W5uH7vJYoQoFlF0/d7hWavkGDfGIxajqUhUYaXCUlPfXoqh/i5bX0fH31HNle7ODShTQra0FBlofuPw9jn3L0jYwL2j4ZqXRkSnNwBHjhOH/ZH8Jv38QgHoNlyYjrZJQx4+PjiHp95lAKnlffFlQ5L+VPj2uEQSuaGi96tjeY/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pSbPFkAY; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pSbPFkAY"
Received: by mail.gandi.net (Postfix) with ESMTPSA id E44421C0002;
	Tue,  1 Oct 2024 20:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727813593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zeYmk7FskEa2du4K8gi2eh15B3ito3tBITmnpXUtYQw=;
	b=pSbPFkAYspT8i9dq7N+o0X4btRnJz6IENXq/faIpo7brbOa8fc2TQuOlEG06jZ/hWhM5O+
	2dISfZ6FDnk/5A43hRTlO0RKUygw3ETmRYWx+VvBC13UzT2druHjDu9PWNHZFL4JISv77U
	9wprPLo31j6RzPBkMEuu8KzI09w2bTieOQs0JdjLErBV2+Ck911EFew8RN0Za4cmXLAuQK
	dA2VDdIbtinPOVTb//xemg97Cw70oofj0GOaE9HmiIAy5UJwOQsamS5ixE6O8cdZ/QlO7S
	+l/z4BMeFVyUwriezMUBDO30gWNMFnx8+B2+qRbEAOSZEbib3EO89U0b24mqzQ==
Date: Tue, 1 Oct 2024 22:13:11 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Conor Culhane <conor.culhane@silvaco.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v5 3/6] i3c: master: svc: need check IBIWON for
 dynamtica address assign
Message-ID: <20241001221311.119e5c46@xps-13>
In-Reply-To: <20241001-svc-i3c-hj-v5-3-480ab8aed849@nxp.com>
References: <20241001-svc-i3c-hj-v5-0-480ab8aed849@nxp.com>
	<20241001-svc-i3c-hj-v5-3-480ab8aed849@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
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

Frank.Li@nxp.com wrote on Tue, 01 Oct 2024 12:02:52 -0400:

> When sending REQUEST_PROC_DAA, emit START and address 7E. Address
> arbitration may occur at this time if other devices trigger HJ, IBI, or
> CR events.
>=20
> When IBIWON happen during a REQUEST_PROC_DAA, NACK the IBI request then
> send a repeated start to continue current dynamtica address assign.

					dynamic address assignment?

With this fixed,

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
