Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70E030E0CC
	for <imx@lists.linux.dev>; Fri, 14 Nov 2025 11:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763119898; cv=none; b=PDv6H2lCFB6TI93oP5X6Dl2WkeXvMgApHxwvHycz+NXZCMaYApN2t6WYiztgXgl33+1STJxVZXZgucQhwYaU7uKj/vV9rf0uj4u30Ub0vmIM1PFLlFcUjT9BnMmVnd26+u9pk+Vpl9oNT5WM5SNlsf8oaJFHRhs7UHKW1wSQQQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763119898; c=relaxed/simple;
	bh=yY8dDK+9+GGlj8GO1n33Q25F++VD0RMhjBiJ+NuW4YM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h82cYS+PvRA4olytazcqMVkLTov1BYZH9y9nH/gaGPmYLk6/br3+EUruEgM6VrDG4PRgpx8BY83qrxuku+JeYdKd0u/7I0QKL07sPN0hta2XwTsisjorAanU35kpUgJOHTxC58mWM3G+mDClhXFVaSpWsEa7wpdN0ezknxR4HwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ArVCJVkz; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ArVCJVkz"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-bc274b8b15bso1325615a12.1
        for <imx@lists.linux.dev>; Fri, 14 Nov 2025 03:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763119896; x=1763724696; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NgRqYgxXqFuMSxMg1tYiXZRbYQe+v5MKT7uY+2QWQrA=;
        b=ArVCJVkzT+zOi2A+sN01e0LXjs0JvkmsTdow6Sh9xx4pQZ3U/nfGuBrmRhf7kmhQpw
         JGlOTAGihBHYuGB1/UvGwDUdWc+9FPOn/8OjKU/GmmbOwkZGz6yk437gmuYH9TlnZv8V
         EvzlajDq2kIFwcjij1dPWitLlWccByO/AqPvo11zItSz3pa3YBSRjpoM2nnHlRKrbPri
         kbdkgYxnQjbx6uJFDy8R17etWroDUNybcOO4EafEtfIr8JBhD1fig4+9R9WOM6cZtNmB
         iNX+miSt3/ZSERQzA6+C7OQWrkl9ydton+W/kKLZ6w/hdy+HWSq6TeYXp8flaafh1WK9
         fiwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763119896; x=1763724696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NgRqYgxXqFuMSxMg1tYiXZRbYQe+v5MKT7uY+2QWQrA=;
        b=KrBKF4UkRFG4wAPxON5qdnYcBdTYeM704IL1P1WkNjbM79RUQ0MV7HLJux7eBiq03w
         OC96cMY/6GOAsfrKpxGc6cKzlmOOjz+Lo2pkjjVNRB2dQYOArnpyqmS5P+88XdRvX64a
         Bx2Uudoq9YFVGnt0H1m5VdIM1rvdn8NQa4EbcDVweXx3rsl9C3B0V25c5ZLDpNZw7CWS
         fIboz7hWkW2rCte91RDQGlEyr4p89ztawHRFueRCXLdKpBvqsesfde2SxPhoS/G1TN2/
         iaxDsmfk7no4+7TUdvfGKJi450rUWBSFDR8wCkQJcZeQoJoKm9mp92CUVB9jh6YGCKZ0
         daFw==
X-Forwarded-Encrypted: i=1; AJvYcCX/HSZ6WKrz4LxG6n9TVMHwB6KkpxgHMPgpe3dWKL81HpxljE1zm+3yFyNfAmrpjWFz2bA=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywltx6CtlXLUdvFo8NVYP4YwTqMJZvlgBNjNyEB9OxNqZkPA3NR
	BjZ/f1JabD3lf5lz7NoJhYBaFx//TVLcDwuNiXnXvwXezhzJnkHfentu+kAjlQWJhaA1C48ooR4
	y/pWhGY7UX/8RpxQ7jPaL+xyyLe4LAeeH41QM
X-Gm-Gg: ASbGncuT0O36eA3tD5mbkVBBbtAyFAm/X+PS4dGLrnTfM/GBwYPUbq0Lafr7hXXvYTs
	cLZXNN8gDIkvnnfSkM4nY1cHYPWW7HJ7ZMg5FW8qILvL7/i0Bdke1OizkigaAxSV67A2etNkCJl
	2Y9uX27mx7RhPvMPMQmrz9wFjXOAztAXyhkSxsQ6AUTxyQuTiCdjIyXXYaU1OhHY5NObI8H2Pyb
	qjXHkA/TmHItmuaBrt5D3q/XWphAfz2SDza+wp39nqyHS7ew0ro51TPNw==
X-Google-Smtp-Source: AGHT+IGlHNw0l3S5Otdz7LKFqu/i+iNivU2AQpyqv0B9Dy5yPo9Tbu6Sp7ewlzeZ12h/NNrQj/U0UFD2ENmJE8ha/RQ=
X-Received: by 2002:a05:7022:388e:b0:11b:12ef:967d with SMTP id
 a92af1059eb24-11b40e84a98mr866351c88.7.1763119895959; Fri, 14 Nov 2025
 03:31:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251114065746.901649-1-daniel.baluta@nxp.com>
 <20251114065746.901649-3-daniel.baluta@nxp.com> <aRcEoX9saonpQuvf@archie.me>
In-Reply-To: <aRcEoX9saonpQuvf@archie.me>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 14 Nov 2025 13:33:57 +0200
X-Gm-Features: AWmQ_bl4gsbwK8mWSKfcnaxcwKhINRTdBoErAsPoV-I3AjKYKB0qzVD9cEdpDyk
Message-ID: <CAEnQRZC7n127nMaCo+UFnfvKHsRZJTMrmNq4FadfzDJa=1UUnA@mail.gmail.com>
Subject: Re: [PATCH 2/2] Documentation: Fix filenames for remoteproc/rpmsg
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, corbet@lwn.net, andersson@kernel.org, 
	mathieu.poirier@linaro.org, dan.j.williams@intel.com, cedric.xing@intel.com, 
	pasha.tatashin@soleen.com, kevin.tian@intel.com, skhawaja@google.com, 
	yesanishhere@gmail.com, taimoorzaeem@gmail.com, linux@treblig.org, 
	arnaud.pouliquen@foss.st.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	rdunlap@infradead.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2025 at 12:29=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.co=
m> wrote:
>
> On Fri, Nov 14, 2025 at 08:57:45AM +0200, Daniel Baluta wrote:
> >    This document describes the rpmsg bus and how to write rpmsg drivers=
.
> > -  To learn how to add rpmsg support for new platforms, check out remot=
eproc.txt
> > -  (also a resident of Documentation/).
> > +  To learn how to add rpmsg support for new platforms, check out remot=
eproc.rst
> > +  (also a resident of Documentation/driver-api).
>
> I think "also a resident of ..." can be dropped, since it's redundant (it=
's
> already covered in remoteproc.rst cross-reference which transforms into
> the link when you build the docs).

My point here is just to move the patches to a better location without
any crucial modification.
I can send a follow up patch if this is fine with everyone.
