Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB39818C00E
	for <imx@lists.linux.dev>; Wed,  6 Nov 2024 11:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730891583; cv=none; b=SsfYoL1xPHs4xU9hVw9zAFm87Gywuhu/k6qpNg/ayREWRGxCbRqrsuqG+pTGoHbqjD9go96TPz0bL/JBhEBa5k2vdd2kHCnrvyRdyeNsmhdltvI7xYadxM5sS+EKtCPJNA5xQ1bGWBjiSfeCvlIJSHGXKZ3f4TkfurR4Nh1yqao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730891583; c=relaxed/simple;
	bh=TWcePYTh3GffUeILuPKuTxypuUWopkhyezSXbvbjQNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NJMDm19fMexv4c4AZwUHK+yAuKM7uVOI7CuqxE92fjHWlAY/5a1ft36LEbOAQY4YWWjKu4fvYpUKh7MaORK8pouj3yPYk3Zn377PJSpvAG20V3MDbbNAzPHK2FNWDT7KUUtMmantTTTkcAeABhVfUHh/zVSObPrOyQE57usJz+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m1CCdgyN; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m1CCdgyN"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb58980711so61519811fa.0
        for <imx@lists.linux.dev>; Wed, 06 Nov 2024 03:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730891580; x=1731496380; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TWcePYTh3GffUeILuPKuTxypuUWopkhyezSXbvbjQNY=;
        b=m1CCdgyNk+0JtAwL16+5uHtg9iRbvfhDHU/0E3eRvQWq7HwtO4SsZMhY4OWd5Wjci9
         2w6o6TsqGx/HK6qPcVqobP8zT2RTmYJKeMfzHFvbFoawuSM+iq2G9ibLBg6hbt8sjKbT
         PNghG82ro7FxZCe+DhJbGeQSiqXTt/l6JMDC1fS+/9pdSQfdeYdRUW+xKK3nY61UiTbi
         06Kkbg4lIT1eom1OId8JM/qnCo0sVOsC9lLE5y5/EAHpYN8mXfaZ4qkePruv4wujDkE+
         bAFSOV14isJ9Y7nm/OMRcHY0Pdf8oyCIIytbO7HtJs5tboRQrJHyAl7fJot/cprZCuDF
         RGWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730891580; x=1731496380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TWcePYTh3GffUeILuPKuTxypuUWopkhyezSXbvbjQNY=;
        b=j2p7R1Su1iCC0aP5Gmudefk50PTk16SBVLRgrrM8fMpN+Bl2jQCx6YYQ6/F+i1XcZx
         5O63tHbSX20E+Hx3+21pvXaXsys3xGwIxEmviZY6ko8rn/Uw5qd7AzSkF7nlprp52SCr
         sj0wrYHJgbUrACgwBs5RucARg0KWLsJDzc4EQkUDlaljCupWVt2V2p1nB5EPSDMBOViB
         2rxMt+cfSnGEdeho3TWA7tb3EEQ+xS5npFP8ez60+9BqvQESLAAqylQ6iJj9slziHWxa
         gLhnDYH1D/Z+ga6WXFaD7ALpnVcwAnG8KDMINjZ/5bLSWT1n04ZM9p7+JNNIJZ8dRH/5
         WdXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXev/6jX+BtDtZQoLN4sw/JKZzJuP5+HBHh3p0KeNmBH+Mtk43ESWce3hINmshKClijKW8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQf11q+blcrHelAf4n3sMl3j/yY9+He2glsrlvEKk2tZqL0nhC
	mbhWu/DJRKmW5h3RQ3G8K1pn3/+Nj7mhIgEYw0QWnxw9L5qXnOKPIO9QSbzMmX7PQYeU7adc59o
	0xU88FzOLpQ3r2YN36E6BnsdsXQk=
X-Google-Smtp-Source: AGHT+IGBnEOZBQXZRo83WTbMByT2bEvsn+eicYIabhpgI3gMWvYJvIZucMS06EKmA+kpHuporqgCTWChPl6dWRrkimQ=
X-Received: by 2002:a2e:130a:0:b0:2fb:5cff:fcd8 with SMTP id
 38308e7fff4ca-2fcbe04f0c7mr148646941fa.34.1730891579522; Wed, 06 Nov 2024
 03:12:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <83aac8b2-f80a-46b5-93fc-3369b30cbfc7@collabora.com>
In-Reply-To: <83aac8b2-f80a-46b5-93fc-3369b30cbfc7@collabora.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 6 Nov 2024 08:12:47 -0300
Message-ID: <CAOMZO5A3dtic1CZS4RJ3RoBP_rV0PpK5oin4J8531XRebkb0ag@mail.gmail.com>
Subject: Re: IMX8MQ EVK board not booting anymore with v6.12-rc
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2024 at 6:43=E2=80=AFAM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:

> Have you been able to boot IMX8MQ evk board with a kernel version since v=
6.12-rc* ?
> I don't have any log since kernel just don't start.

It is booting here for me:

https://pastebin.com/raw/h95JZgjk
