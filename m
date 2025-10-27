Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2618A2EF660
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 10:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761559593; cv=none; b=OBaIVKjO8wOuoZloKfPZ1R+RpCn0pTtDMMl/1U3Jf09yezcVxth1C5yiM4O+nKnfLId8MzKXmniSpq81wSjYUhjUBqqQh2hNfmyY/jYZZ1dOhTSa8o4x+GhLhFyk/hVjcunJE6qSIjVY1VtORJleagzWoxFfXTDCrftab6dhKOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761559593; c=relaxed/simple;
	bh=l5doOeAnSYSQI+MnlDBwnrzy87dYaAS/wZNmV4aDiaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WY2Ts/R4PcIZrr8vLcgZB/WMi4uixEfrd/S4+Y/p8H0JjNVdrY+LSsUMDtbFfinwlmCLYAzCYGZ3r/j4PnH84VqM3jftNK71MmLpFOLpVnVNPfqjYpCed2/s5/eAOn6vibfKNJiQW222Kq2Z/RFPe/5oxKCkadAM64Yb00Z7ClI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VfcERDLZ; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VfcERDLZ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-290ac2ef203so40991305ad.1
        for <imx@lists.linux.dev>; Mon, 27 Oct 2025 03:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761559591; x=1762164391; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5doOeAnSYSQI+MnlDBwnrzy87dYaAS/wZNmV4aDiaM=;
        b=VfcERDLZx6RZ1PASCWRStU+y++UeKVhq7+b6BDYkAu3wFi8wfheTx81AZ2k+4N0JVW
         K2QAbt/vmA36AoINKqa1gx1jk/0w/WEbR/jRHjGnqNrevglV8hZDuj3Er/1G+jVqfozx
         mPTNMp5CBaYq9cVtNcTQezR6wZHpVfV5o2YdzvtbvJImTCPbvqHGc3Z5pa2SCIlSffug
         FikQjQqWuivWfLZVZ4mD+lx8kELupJrBOTx3s36JMePXNqEtkmkANe8rW8h0lUCXAHcD
         oNw9xudKFu7dTRKsyFApgkKBq0mngOoFc9i4be5mnFSAFgFGWokTdQa8pT6mGWGzz2Lr
         Li3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761559591; x=1762164391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l5doOeAnSYSQI+MnlDBwnrzy87dYaAS/wZNmV4aDiaM=;
        b=l0ZBEL5hc0MQycFAYqKZG30NhezBHhhnXqXguzULtZvpGhyxi4p4alwT1StVSY6XvR
         KjMe7go6MOdgTHrFqpQuexX4aEwP4WEGav1NubBn7CvWwOcgrdQbL1n9RNDA4iYo7Mwv
         VphcU7XJpish2VRaq8PM/tv3af6OWC2YuNlxFW+FljlKDjzR1lL0VMWxL0eIdJD8FZ41
         m30dHY3vbujWpEkVnGYxtm4DYuUh5zChz+y2tHTPgC2QDg6/bRKQ5N3M2t9sOgc1xiOu
         Ay3QFY+YpG9AtTpKHqgyHwHchbljoKXA5lx73K9eQeIoQ9x591rLEZQa5KNM6i1yEVuB
         +OJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEw+uQL1UFSNV8rdVFFtx4URe7k6e5VwzAOKQlx81Omxif/eaPaqg5pBUmwiroxqnZnj4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzh5uNYDrP3VrhZfJb1GDBvPMni6cY/FN2hD48ei/4hRkevi7Qb
	fknLtN3dNQaeaQEvKbB4ANrXLnb8juLHxY/PTHDWtvGaZABwsixRBMsuW9pGfy63XIuz9hkmwZP
	103K95OIa7Up2a72QTLv9AdHDkUGyPzo=
X-Gm-Gg: ASbGncsjkm+edsiPT55VYYgHEonnFKm1mlpF+ph0J2ddC7mteNojcN2KJYvdZqrKG7T
	DsRF1948riBrWObvK64lIVLVW1EMryPW9esZaOkMUxCrIkxaYgedRBHjBvuBk/Qljg/ssUwdWC7
	juCWJUMfeZvhjQYcXm6DaxLcj1F9Y7RFONTESeTq24mDHEn2lTpknXd732zvzmaeo20CiitIDV9
	LPJenrrVVAcVgTUKh8B57YDl+JvIiBHKOAvxJCmspOLWJpr/o89wg2oYMtY70WTFo7sZDBri71u
	Y1kQWhx6Z9yBOA==
X-Google-Smtp-Source: AGHT+IHRpB86RXroRDzzRdYSB7oYFAv4dqfXwWvXOZ++yIISCsXtN6hFohYhh9Tmy4ZRUzQ+j+Lng2VlTrE5kMPFzuc=
X-Received: by 2002:a17:902:e5cc:b0:270:4964:ad82 with SMTP id
 d9443c01a7336-2948ba0d9a1mr120199225ad.38.1761559591357; Mon, 27 Oct 2025
 03:06:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251027093133.2344267-1-max.oss.09@gmail.com> <20251027093133.2344267-2-max.oss.09@gmail.com>
In-Reply-To: <20251027093133.2344267-2-max.oss.09@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 27 Oct 2025 12:08:57 +0200
X-Gm-Features: AWmQ_bmTfGXGF5x3XTOBQj8jm2eoTyHs4EQJMNTtCvVM7Dk1SHwZVtKvKWhTgLA
Message-ID: <CAEnQRZDrqKFmenTiNi4U==X-xE0pv0Qt=qpXJAVi4sGvnBL4cg@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] arm64: dts: imx8-apalis: cleanup todo
To: max.oss.09@gmail.com
Cc: Max Krummenacher <max.krummenacher@toradex.com>, 
	Stefan Eichenberger <stefan.eichenberger@toradex.com>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 11:32=E2=80=AFAM <max.oss.09@gmail.com> wrote:
>
> From: Max Krummenacher <max.krummenacher@toradex.com>
>
> Functionality has been added without removing the associated TODO
> comments.
> Clean that up by removing TODOs no longer applicable.
>
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
