Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1FD2EA75E
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 19:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784575800; cv=pass; b=kgMOn2On7vCHEDQsUd9FWkyTNqYdkF+zfsCTbvaQwRueh1uHQXcAF571htn+BGyAkv1MhDKBbfWH31wT6kdpxQLQVmBM0IguQZWGELAgnRYGVnl6I0tL4HPbDE/aKgfBUWsoJVG8mIC3a3Lx5STeQp1qmNzRX4dfnafSip/LmlM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784575800; c=relaxed/simple;
	bh=FkD3jB2s3IIbN08+g0w0TygpA5tj0fOSjjBWkNKDgEk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CgQrInMHjEa/jBf7mgLm3IQgW3a2Ok3ohLO7oZZH+n6ngwaiqbmaJVmnwWZG5OklAGp7Ma/3bcxK5gNmwsIA4LRTDoVqTRMdrMM1Wnb7uCS9IuD1NigKTYo8BtbeyGC/Nw6f7SErhgeL250sW72CM/AFW9QvfRRSfj4JQly5urI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ghBupU0A; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ghBupU0A"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51c15a5b265so831231cf.0
        for <imx@lists.linux.dev>; Mon, 20 Jul 2026 12:29:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784575797; cv=none;
        d=google.com; s=arc-20260327;
        b=cUU5nZCDuOyytecSlgxzwlenZ5z582ykgPpr4l7V1PGflHknpxH8getdJ8y7uQAM+O
         1V4GuZbom3V5Bi//1rTHNmh+OeB/cMhX1thQksjFGf9KVEQ8hnvEExRJNJpyPzG8m1yv
         wa/iewRUr4gi6KNZSZ5eU3ozJIHicXSj6HFUe8k4Xhb4vZ1TxXQn9wwBBh2L/YWRkxr5
         zS8XplsnnyfT8FYvwB+P7oFf5eTlHq8pBxqK2M3clEekEXoZLLBkkHfXeY4xgALBcWet
         V6uj8NqkIPwuJNgZVPhEWMXjTXbNFszIfcfU4q8FEpiV0LNdjNS4jW4dd7jaZGR+jaDO
         T0cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FkD3jB2s3IIbN08+g0w0TygpA5tj0fOSjjBWkNKDgEk=;
        fh=iVtoUNeJJPkAnMQdyUECK2WEDY8fyHP6i4J6TXvT8ew=;
        b=Q6l5LWf1z+g5qaDiFdJBMUFtQK57/QhM+MlRXXHbnyw5kml8jKNNyiehv/lqZEsMsN
         gQ7jtK9JdovfVKKLztY2eDGqRCs3r7gCNBs4H+omO7TMRaUoxZKLuTdMWcdvELNaDKfP
         NLCLJl3Kfp5aLipf/E4uftDfiJqvEGcWgpP77lSHeCjlqTZT6B/p2yVBGjSgcpajwpTc
         H3PQ2FaA33BZVY3Zi34dzCfIO+O2yvUJW+whUTDeSGnNjNGwl2QSUw9a76qbQodp/MxL
         P0o7ACQWogyHohlSbhXJofkGFBfpiKdI76hQRbZd33QY03ENyGdRLy1H7MbqToYV59zR
         fkcA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784575797; x=1785180597; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FkD3jB2s3IIbN08+g0w0TygpA5tj0fOSjjBWkNKDgEk=;
        b=ghBupU0Adakl1RD7df0+F+z88lSmKXswkCJAahGHD5rFSUF9a4rMJ43VXFs2Bo5Dlc
         n+MdQPk/AvSJ+gAExLrvaXAAYQIIFt1WgVPIutv5jzMy9kVPinexATZMizDfYTOWxJ+w
         Y0Dl0r+DV1PpGMfaS9VtGtsRRYVsq0472WLKZx4MUDqYXt5oSsEPt5HTofyWaQGLW2Tb
         O96WZtoQskOG7qd2LwN1ONIYF547rM8U2ENgZTkKP79Jf2ToATONHvbfrUyrckZtP2ha
         SrVUYRJPs1w69VS/tXatWnrfmCxmdHVp2gBdnSuPEzpBiwBvP+AFKBjeLMLVUUgG49hh
         NwGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784575797; x=1785180597;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FkD3jB2s3IIbN08+g0w0TygpA5tj0fOSjjBWkNKDgEk=;
        b=YnwR0uTW9EOf92VoHTAcArnZlDDHHZ2ugVrPVrzicPpMlG3zr+vO1qW4U5lTkiP2BC
         kd+YmiN7O4nhDtIjlcywagKl/lYRLj3WVCDHaMARptQ3cWppkguy5ryH1PmvakoZgZPa
         sTY5gfbpc55W32b9iHFF0hcQmDtxAph/GILQZYAI6CKSkb6aEQqWTn6xZnAI+JG4auZi
         MUAfPgSrRO0cm9xu0J/mPy2kAHpYbY0cQYAo4NNNo/DNt2Jh9WGuWVOmVYfHHOc61Qar
         g23coTOdeKIIRC2GQUwV7gGgQytIOJJ1Vw7/WQKM3KLxk00kQK6ByDOPFEbRzKAU2igP
         FexA==
X-Forwarded-Encrypted: i=1; AHgh+Rrj9WNFXIqMmmiEeTMvmVT/HhEZXs38VHzeVJKdru+TlvL/h16px7IOt+7imibl6DmMUYk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyySDQEyhWZlLJ35kQ3YUFgv8xnqlOx6XhN5poYgRRszBCmHfUT
	3N19UmtKJ6+abVwNVznBhjWp938I1o0JzAhInQE+U0G6jLhkcemzkV2L7xkeL1WAcVjG5IpGIkj
	lprIybO57wUkDLkjSdK/P1e9Jl0hR5FAYDDNLOIGR
X-Gm-Gg: AfdE7cnPd5bbaQ+WO7Y1SGC4qk/Ief25SjCG5YWjmfWKiIezhovWGJ5OXTY8gLFIZQ2
	XRfPU8GbZrQT2XlAeXgxhBvjRH4lb8fxt3X8mSOHbstLjfFROkQiBIr11OjAvAv7X+4MlcEtFHG
	X3SvSkJF9w/yJYnFNMu53PTen34yobXfpOt/NuVi6Gch5kXBlcY+qL1Qpi8XGo4oKa667VQRH4c
	NvwRnj+Gm8SVtfJIUJfwOH1xsxPnLA8plKrYyku/rRNhYlghV3KfSlFo/o=
X-Received: by 2002:a05:622a:6d13:20b0:51c:7a90:a79a with SMTP id
 d75a77b69052e-526033764f4mr4774471cf.26.1784575796860; Mon, 20 Jul 2026
 12:29:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com>
In-Reply-To: <20260718111340.159896-1-linux@yoavmoshe.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 20 Jul 2026 12:29:20 -0700
X-Gm-Features: AUfX_mz0YGJIXTAqoc42mflq1D8eqRe1dNjHeR1gvxIC8uUY_rJ9mhzujQ94LHE
Message-ID: <CABCJKudqGL+BFFcz3qsuoJB6S_OAt-vs2yqePC_=oy+JzmPpVw@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 18, 2026 at 4:14=E2=80=AFAM Yo'av Moshe <linux@yoavmoshe.com> w=
rote:
>
> Relocated suspend code in OCRAM lacks compiler-generated CFI type
> signatures. When CONFIG_CFI=3Dy is active, the indirect call to
> imx6_suspend_in_ocram_fn triggers a strict CFI violation panic.

Would it be possible to just copy the 4-byte CFI hash prefix to OCRAM
when relocating the function? If not, the __nocfi approach seems
reasonable to me.

Sami
