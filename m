Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8FD1C1F29
	for <imx@lists.linux.dev>; Wed, 19 Feb 2025 12:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739967496; cv=none; b=si6Y/qtNvuMcS0HN0/zsX55sN5J6kYf+a5gLh5zFgH/rGj0QOKjeMxuII/HGDs/P+PI7ODYSSkMJQZvMc8mNIIYMmmF9iR0SZ1H6LL9rWeS0HP4QUBQ3dqP5QK/BlluuuMkKRL9DewKevMHVAm60kTNuPZEKulJ3hjM/E01ywqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739967496; c=relaxed/simple;
	bh=CkJjV4pYyBmnvMr8dXnwe++5yWa/O/7CmfltUEorV3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oTb2mUIJTJLXOWCwpCTUDCJ9VDA0FvlkWoKZkmKMeg8cNkyJ6a4FZUFtg6pe2DB2ghKJVwTJnh7mMnVS31It1IvIVak0Oghs8AEQ2xPUPYAbA9CDFwI5Q3FMYbDOVq1WiglAbF6ZyaBmhMe0V8lTwWiU6ZyLXx/Njb2QJwJ/IlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZMjPqQ/z; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZMjPqQ/z"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5439e331cceso7618920e87.1
        for <imx@lists.linux.dev>; Wed, 19 Feb 2025 04:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739967492; x=1740572292; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VTPWbSgjrTLpPmlX3MdNrwi/24I03HDG8gfadoLFfKo=;
        b=ZMjPqQ/zIkfAtjYsmj+t8eIro3zq/zUjHMXuH+5uIBIti0WNqsf3P+1Lo6tqiIsz+9
         KqjCkMA2bKZ+dg0k2ggFOi+GOPJB5QSPJPs+aR/HXxy0SpZHR9WkcHbKrKrOvHLNgAcE
         NlX/eqSrF3Jh6qPLWovw52GGe4jaZl9YSl7VY8rIppxmhu5BNRPwOPNkdMMYzG8Dxaxe
         U5Q8LZjwGS6pm4NGBhMEJZ3sP1ML5Gs5/9RpHu0CwaMKaDySSHJmCu1cMZJwytEeOesW
         WcEM8lVfDPlxGUFVq+6u+BJcTl+LB1w4L6yTbgiUqZhNzXKzi48zey9iHD/zQ+q5kQdA
         D/nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739967492; x=1740572292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VTPWbSgjrTLpPmlX3MdNrwi/24I03HDG8gfadoLFfKo=;
        b=sMf2WbN37MY85ZHdO0B6srh9BCvKEH6Gt9jt+dSvMXMh1XfW0Y+U56comj8dytV7Hr
         Pdu+8yjnXUPTzurzsAPcW1r5oUcKGEA1aC8lBi26XWRsu464ox3ZVhdvDFs1o/HnsMwO
         uZxiDjUAOMf06uLj0s7rad7YxNaPoW4w+fChw6zj5of+O4CMzVdX31P1NSN9VmwICyqK
         lA5V1dxP7JqhqZopuRO/d8knLVxYhZBY1xicrp3bysdz6wCsau8r2NqUcjNkbY/4hDF6
         cVPZvzwOHYuEhVGiLYFhJwXf9Djy85HpggZF/UrQ+kq6B+B7rsPdr+IqnXrPs3XOtDTX
         56RQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTi/HLDL5PdCfcmqiz90e9ZsVLJ2WLgFwjxe2GZKKhjSaY0sMIFQMZB0bAM1uBJDIt2Dc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzX+z6N4iyV1GiZ3ed4psNPggMY4wTVb8oSV+DRmL5XQCL5hj4F
	Rx1jQ3eZ7oJY+gSw1edbckXFooRJ+VQiC5QbIG+Ncl57EWOeA+O0dwr8cyLZzzMDvjaCn0lLbYA
	ORsj7fw9/ppGLX5grSnzeSJS3NwE=
X-Gm-Gg: ASbGncsMsIrMj7Q2/QmC9jcUyXpnNRCdtSTbR7ddEpxzlv/ssLtee1pKvCp8YEXnhAk
	kRp41PhCd8/N0kim8NgWYH83rXJ6Iz1/KT8a0xGsvTCvZjyNVb+7/oDq7waz9Qaf3rw36z9WXdU
	HLczD71jXP3py8OTLdlP+OB87zn6I=
X-Google-Smtp-Source: AGHT+IGjNIoen8ULKXTmUUOdA8vnMJhMrh0uHRpn94zwbfBEqhRrLoruJpWGVHqyNRMVU7htjBuXJmu/uj1ajZZO9rM=
X-Received: by 2002:a05:6512:3d28:b0:545:2eca:856 with SMTP id
 2adb3069b0e04-5462eed85c8mr1170113e87.9.1739967491394; Wed, 19 Feb 2025
 04:18:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250219114936.3546530-1-lukma@denx.de> <56e56623-9cef-48b9-8a57-ef7840f0a8f3@kernel.org>
In-Reply-To: <56e56623-9cef-48b9-8a57-ef7840f0a8f3@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 19 Feb 2025 09:18:00 -0300
X-Gm-Features: AWEUYZl9H3BRYlwGymanzXLFA6lr62seClEuWhg-mC8ltYhyVYgZA4_v-XW8gpM
Message-ID: <CAOMZO5Cf3JpKBjQXdjWNeSgOCOLmcNuSvQpR_ewiFtH-p3KwfQ@mail.gmail.com>
Subject: Re: [PATCH] arm: clk: Add ETH switch clock description for vf610 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lukasz Majewski <lukma@denx.de>, Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lukasz,

On Wed, Feb 19, 2025 at 9:06=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:

> This defiine should not change. If you need to change it, means it is
> not an ABI. Just like for other cases, I suggest to drop the define in
> preparatory patch.

You can follow the same approach that was done for i.MX93.

Please check the two commits below:

commit c0813ce2e5b0d1174782aff30d366509377abc7b
Author: Pengfei Li <pengfei.li_1@nxp.com>
Date:   Wed Oct 23 11:46:48 2024 -0700

    dt-bindings: clock: imx93: Drop IMX93_CLK_END macro definition

    IMX93_CLK_END should be dropped as it is not part of the ABI.

    Signed-off-by: Pengfei Li <pengfei.li_1@nxp.com>
    Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
    Acked-by: Peng Fan <peng.fan@nxp.com>
    Acked-by: Conor Dooley <conor.dooley@microchip.com>
    Link: https://lore.kernel.org/r/20241023184651.381265-3-pengfei.li_1@nx=
p.com
    Signed-off-by: Abel Vesa <abel.vesa@linaro.org>


commit 0af18ba60752e8a4ba34404c1d9a4a799da690f5
Author: Pengfei Li <pengfei.li_1@nxp.com>
Date:   Wed Oct 23 11:46:47 2024 -0700

    clk: imx93: Move IMX93_CLK_END macro to clk driver

    IMX93_CLK_END was previously defined in imx93-clock.h to indicate
    the number of clocks. However, it is not part of the ABI. For starters
    it does no really appear in DTS. But what's more important - new clocks
    are described later, which contradicts this define in binding header.
    So move this macro to clock driver.

    Signed-off-by: Pengfei Li <pengfei.li_1@nxp.com>
    Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
    Link: https://lore.kernel.org/r/20241023184651.381265-2-pengfei.li_1@nx=
p.com
    Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Also, the Subject should not contain 'arm'. You could use:

clk: vf610: Add support for the Ethernet switch clock
