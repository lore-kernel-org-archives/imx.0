Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F132D4816
	for <imx@lists.linux.dev>; Mon, 16 Feb 2026 11:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771240314; cv=pass; b=gqCDZnTVaWZrj0xIOnbYQRw9NROnn6ctGr/a/XlltMkL7e1bm2hmy1xwmp3TzO9G4ivJTFBnt37kVvFEes5ELiVG/5ntuN0UYF0PC6O3uXUnK8/0whKWfAVQsesPGSsG4H1qa7Gen/v3g4EyjClnGIxcwVzUyrUZKFJLvTB9O+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771240314; c=relaxed/simple;
	bh=M0ZUjKtHOn7t0ohRZI+p9mecYLOwFK0JZ3NjyrDFJKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DTe5KbYI+PVVw4amYA8RKfcHxv4fdG8AcComr/fHElKRDmROGr0n6uk2pHndhEvlEreX1pjNTEl71RwuYWnGMzrW68z5V2Hoo6REcE2tzMdGNcCMx7VZ2gMeNiV2x5xZmy0cP4GY6jjSAVhcWt0RZQdi4wP5eJF8Ocr0BGkpQv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j2e9/P+Y; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j2e9/P+Y"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1271257ae53so3027221c88.1
        for <imx@lists.linux.dev>; Mon, 16 Feb 2026 03:11:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771240312; cv=none;
        d=google.com; s=arc-20240605;
        b=OQDk3M0Lee/5h+swfOkCBkRM74z5KFLGRSZIPuCCe+Ti6uwr+kiUGZAbAoT/fFf55r
         4sCfspb8qdeJzvmd2YbOT/cW9FmCmzaYhyD2XkTbS0kwmSgTU2iTwZpRlI99eG7hFdEJ
         6JGFtVnqaKo0DsrINTm1viuOBG3YSBVHDzp2tr/8DMixoZmRd5wCJbtzMu7TFl8LIcd6
         IfsIATDfKdlfurAW+dFGy+ApHhLwWOV+L0JYM4MsXzX3iIW3k0hAtzqMAB/OTGDyBRoP
         ELTCDN//482DSHsyxtnEEJU2n8w/EbpmKIO/kAt8xKu6NZ5oXuC982/GdBSARjMe83wv
         4v4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ftDignL4WzNnl5qdQF8sL+16BU85AR39R9Mhqdc8SDA=;
        fh=+9L+OlnL/Jw/qj9/DcRBGWtvdCzMWD1xK9DqXXoqtbs=;
        b=d2YBoy5L42FAwLbhbuSTjWpkYPqSIPRSXPs4adN1fD8uOfAEGhWqEQrR1AvRpbR8n2
         KUqs+ipgssHzGwka9FYgww+lrR+w0aJ+o4HEX+BgSb196/bU3apDuu80zReTuEVTouzY
         mv/FzHKHAIlRjXmA3/NOtvJE1oQUwH0mCgjQKbkf8htd3zJcExueo3CsfyH0vl0hdQp8
         9FVewqftwrIJui3BjhC/dAaDLQerJ1xGY5YMVXowRmk+okW3GckUpzv9NTLRd74kA3lF
         jh4zf1sad2Wj5qsuyTWq8WQmEOModqd5TgIYgpRwur7CcmjaItdGSXrNlFZ5fdVABUmN
         YnHg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771240312; x=1771845112; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftDignL4WzNnl5qdQF8sL+16BU85AR39R9Mhqdc8SDA=;
        b=j2e9/P+YschsLueBSkSbGA60PhOS8xK/6v+zoeZ2toKBG24/AcvBrutOwMaCj7wYBZ
         F8pZSONjf7TpGji8pEO3IH1jALfclrM7eVZd7EC7/X8QdA7D5c/6Bio/Pet0CI4zcjq8
         GjjTrIcNMuKRPeg1kFuAr+mFXxWZTPjDJxi8e2v7Rbo83qnG3VoqUguX+ijzp4WC1Ecm
         m6IJ8QIX3v+t8OyEGG+OTe2kpP1G22mkuomiMswZW/BtGfI0cq48EBHPx8qZbxFN8rN9
         GouDUZguVbMqf7YcT9zSVl2ZY6hzxPY6cjwz8Td/9MOdoMfKVksfLy+oENqgA39ZrEGi
         QGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771240312; x=1771845112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ftDignL4WzNnl5qdQF8sL+16BU85AR39R9Mhqdc8SDA=;
        b=OHnbPXMMwEiGAN3yw/bBdia6kEOTyxE8j2SeNnKeHP8zFp4BAUaycsgqtKaiRjc/Oc
         oRzGwl95O06Gu9Jt1+SzR5z4Zpq0hk5T+JVAbtYnq1fwuWLS0RtLKKz0yBAHqESLBwf6
         KaJg5xindllwFnGgkci4z+4WCyg9Al2Ceplp9zYCYK0gxvhZMKxK2kO4sliSK2h5nSUx
         K5g3qlvSKvFh/lCZfB8I/BmHIF/n73Cw5jRLn9xJY1Rj5RDRhs8Pxjf5DnSRm3fDip7/
         zPkc3KKPUR/nfHZeEXdozss9tt7zKe/cN/52+fuxIu3G0UZ26kc+Tabc9V0elnTmgg+/
         6CTg==
X-Forwarded-Encrypted: i=1; AJvYcCWwRLa+pRCXSjRHjmSxkgUbRsMa2sEzAcdt/26INkQvYhPDJGvIQowI6xeG2DYYsT+HJO8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0hkxA+Lf6R9mH6RasXTpPXIJqZJNJutgh7yr2/RWMuwdzm68d
	sS4g6gTvMgrztHEKfF7j2M96CIj+GAAAI2zA0hd3FUpM/5omko3Tdn7w8YtRjg132EAhjAG6CRL
	ErEi537V3oXFTmJFV7FxJ+B0UgGob5xQerg==
X-Gm-Gg: AZuq6aLHgp3ZD6VUhA6rKy06HLxsELPSS0Hr5w+OoMJ04VXn1GDNxvKc2u989XTcoSN
	OfoxIejNIRifdj6pzu7L2HFuutK90v2R+WAH2+zcAdktCdbbgVgR4gYWuGbwXiHULeVxjCrQBsU
	Ud5AUyJ/Mb6DxtBVrB4XQ4tP9aBRnN9OxOM5/7bAcguq+jSLSZd00qXXzuIPjGMcf1nTgmRsprs
	32xdVDhBvTF9LZfqM1AaVZk88eRNQw8BVCx03CPooUBByNHJ24uulehlPPJpYRRlzpErzEBbrsa
	noBnxOl/od3cuRtrTmW3KWuoJCSUJh9CcZYQBXUtOv48d5yq3+VOQYyeMN/PHD9M3atD6lnw1Bo
	zUSgPzpYiiMQTIwiPSdCTXQ==
X-Received: by 2002:a05:7022:522:b0:11d:f44c:ad97 with SMTP id
 a92af1059eb24-1273ae2eecamr4723312c88.24.1771240312306; Mon, 16 Feb 2026
 03:11:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260216082329.32029-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260216082329.32029-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 16 Feb 2026 13:14:41 +0200
X-Gm-Features: AaiRm507exKUTRJTshhh5puxfJRVlFQ2G216FPRQAg0rPj-3mSrWr8EUdA4CEy4
Message-ID: <CAEnQRZCntEfQt9t0MO04rryDVDGn2UT75_uw0x+F0q73ogpdmg@mail.gmail.com>
Subject: Re: [PATCH] firmware: imx: sm-misc: Make scmi_imx_misc_ctrl_nb
 variable static
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 16, 2026 at 10:23=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> File-scope 'scmi_imx_misc_ctrl_nb' is not used outside of this unit, so
> make it static to silence sparse warning:
>
>   sm-misc.c:19:23: warning: symbol 'scmi_imx_misc_ctrl_nb' was not declar=
ed. Should it be static?
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
