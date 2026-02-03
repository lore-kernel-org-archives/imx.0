Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F183933D4FA
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 13:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125097; cv=pass; b=TnKdWVW9XW0cYhg1cnXJ6mUG/1Tr+Mwezfs6KdCaoVKsOJ+U9qrwn4pGhJWRl6wjKPAokpjGwu4F1bgfz7mR/mYmuMpRmYwII4Sdl9q2NXcedq+zNssiTvGtfY/x6TmxhF/hJdyMqYoQ5L0lxP5tXOMMNi6NklAYrqm1rDCMLTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125097; c=relaxed/simple;
	bh=ebaYgffeHYn7gzwVrIV2yDgbyv8PU9o4IV7Dp2Fxs/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RIJpJ7PqmuhD3Vu1t1C760utpnsau6rIeKeR+aQBZIeG/ZjjGO3H3Jt8gj80H/cb+4V7vfpyXRJ36RXfw2NO5mUSVlsf7DkiH8rW8oV7WOmGgbR1HY2TG9OqzpLRE9JJey8fVOosxUwzyv2mWba546Q/72XN1FqsYWDvJZfcFVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jYUQlbB1; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jYUQlbB1"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-126ea4e9694so2831300c88.1
        for <imx@lists.linux.dev>; Tue, 03 Feb 2026 05:24:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770125093; cv=none;
        d=google.com; s=arc-20240605;
        b=bhsxk8ctg3wjkW2/fXWHNrtYHMhdj9a/FS8wk6mMa0Qcvye/c9R3BN14E2jmYP7ypl
         YPclFkY2RKJMea6oSB1BrVoEn2UMozUs5+X1uWTlKQA7v7MRo4vNBPwkqrR9+sQ4Gni6
         UDlsk2/TXlfoSPPhaHxaaddydIr5Sg7+aZLSevGf5s8jkHMPVw+WM+caMwZbWSF526fA
         tW/WrNFQidr3ga2q0ZU2+BpSB97U4b/ZOVZ7zfpoB1sHbZX62SS9nIz5Jm1IfMEx3Gm3
         amL98aKMKh0p+nAXW/1ILAuNSAJUGVXXSCEDWHLNmMNRAjBGT9RNpAsGqPvO+ZUu49eC
         ZKHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/hci2sdsPCD9iRXbhf00hUDFJW8K56ypEr3d1bbtrDk=;
        fh=4L29a72v+sIDJmiLc6WX1ChHUknkcbd4Wnkk7RLYU2E=;
        b=at7xaXoKflENzzTjP0wuPC45taiwWHAQJADk13He4u809SzCLNdxlY3v6MtCQ/YX+N
         QeHTFDNrPfblMxgLnzu+fjKkU2q+3i/2LJzg1osMnXIEBWlkseS1qpvaGo5P6UWLDOcI
         zq98SSQndJIypJl/+YB7ZAAFn8zcirTkQpjhIvaF+jZ5NYWHYKOhdYbcYmGVcJFZyKhj
         7xj/BW3iCb4Gkz1oDCOv7StuMlkx8JTP7u1azVExj97ix3LTSZeqQCWlzmGJSqZNkXZ2
         VX920SvKld+8aBGnxovTmCRxnVKQ7M4RlkYV6Qjn6QFwBVVJ/TDIsxYgZDCwNoAvrK5l
         2rIA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770125093; x=1770729893; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/hci2sdsPCD9iRXbhf00hUDFJW8K56ypEr3d1bbtrDk=;
        b=jYUQlbB18ERLmiLVRa7sFzfmv8ykpfXHIaj4eKQU9Z1Tjrujpe63p+cOMLx5Gv4RhM
         5XEmQ84Jt9nc18ZCcmsnBDVUvmvFzOmjlR6oImazRbToJZgtBSNsYi64cpUh4BMmU0NL
         b5WSr4gwD0jdrKDNF15jvOsdRgmJAROgfoSdfayN5iL9Fs/uvjxbROqPYqrS8q0f6ha1
         3hG4ZKEwUYGHX5BNFGyHJVEtmXOjWb7KPtTI4Te0yPc761/0VSgyTf0jAmp21ZcCLPAr
         aoDIdR+rF4GD67fwU+AAF1p25IYup59uBxqACSnXIBLAgzhDJ/tSabsdHaRqa5wM7TW8
         dOTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770125093; x=1770729893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/hci2sdsPCD9iRXbhf00hUDFJW8K56ypEr3d1bbtrDk=;
        b=Ypq4fsw4ZF543F9IkEi+8R6YsepgH14G7s/9NTwJ+bzsjlt71p1gGOJ+MFYxb+UzAB
         HJtYmcBBMdGxyr7gd07E8xxy47/FZLF5fNRkOJG6h7stMIzYKci9FRnwuuNkQ1FnJgwZ
         JTxGjMFztKvPslccJg9vmGwD5oq3PhFCOkIipj9+5xxyog+X49B55e/at0BzeGY0YKrs
         2TxehAjF+8tInGOR2c6sZPBa/UjeB7JFLEAAmJwfZ24Txlvthg0Vnvzvq9cIrKGLyg3W
         IxECQBQchJfMMYnJq/fr0TfGyOKkLIpLRrh+oTgsX9arathK/YEc7IhJm7E7QBqMF+Bt
         Sh1w==
X-Forwarded-Encrypted: i=1; AJvYcCX3s5fHzQUw9+vSf7B/GvvqmdOe5Y5B4UrFWThkPHVh4KhKuOQYyzAUfV65GgY6fp7oG1s=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxi/6mjGYilnU77+iqFradTR8lPgIbDm1jmuWLY4fDzO3jVzzMq
	X4XK68PGh+fcAyJxCPjjN4PVfdKRiiA13Il7RcoOnmE4KKt7Q6pVuzfaKMwtvNoL+7d2AW84egu
	1+SCU7ypHDn2ZWDCPETYB6lBUJZr1U+o=
X-Gm-Gg: AZuq6aKp6xbQWLiKYzauqyKc3gBUaPRoeZD0WSC3ujtZITvVhvFj68U+SEf3HIVivsP
	1B1PiFDaP1QToNpwEKGbmzSZxqRhxLnSYCv5PU5fTod1025TQ9GjDjisdISgTD0wSQmqQHg67WS
	ovy3wgtQami35sNFR9CPxIypAJxDes6AWmU3fMoTz74CrMqRCc/8qoqvQ8B4wnWzfdfxzFmc+8T
	IS8U4yuah+n4YNdNt0QQzkw8w4wAIgvlS52ZC4ffywciIznM4EQXL2bXJtU+uuTQjLmRpWWzpWF
	FTXrrMhHcEl81Uiex5rQKo+mT8gVqfe93Q139ynY9vHoejSE8SwBYR2EwWnze5Xk5oH+L9oOEs1
	XGp50+AgjMQ==
X-Received: by 2002:a05:7022:6b99:b0:11f:3483:bbb0 with SMTP id
 a92af1059eb24-125c0f984d6mr7727526c88.19.1770125093214; Tue, 03 Feb 2026
 05:24:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260202205758.3044617-1-Frank.Li@nxp.com>
In-Reply-To: <20260202205758.3044617-1-Frank.Li@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 3 Feb 2026 15:27:39 +0200
X-Gm-Features: AZwV_Qj2z7qbutwvB-NPA1F-KcZIWGH03UnT5CBo6gdKULcm6QEzcKu28K1kX_8
Message-ID: <CAEnQRZCrCEa9TixELqZGngXL=TrWO1i=m7dqgLtcx_pN+wEaWg@mail.gmail.com>
Subject: Re: [PATCH 1/1] ASoC: dt-bindings: ti,tlv320aic3x: Add compatible
 string ti,tlv320aic23
To: Frank Li <Frank.Li@nxp.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jai Luthra <jai.luthra@linux.dev>, 
	"open list:TEXAS INSTRUMENTS AUDIO (ASoC/HDA) DRIVERS" <linux-sound@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 2, 2026 at 10:59=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> Add compatible string ti,tlv320aic23 to fix below CHECK_DTB warning:
> arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb:
>     /soc/bus@43f00000/i2c@43f80000/codec@1a: failed to match any schema w=
ith compatible: ['ti,tlv320aic23']
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

For the next patches I wouldn't focus on explaining that the patch "fixes
a warning" but instead on adding an undocumented compatible string.

The CHECK_DTB is just a tool that reports the issue which you can
mention at the end.
