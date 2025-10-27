Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7EB2857F1
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 10:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761559477; cv=none; b=lS8Pmq/1PZ2wLuJSR9r7AM7k5FvsOsiRR8Xkktk8J3mR/uPndOPm080m3kIZmxTsQD0RFMoJSJLOqfzwCMdDs+4xlHlpzztP1CwgS9vMaZIRoDVOiqfIL3RtAlORQxTDQJsP+qT5EWpxDSYPvmFF3woF4G011kDk9nOKlSYprd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761559477; c=relaxed/simple;
	bh=bZ+q597kUNGqIq8Y48TGj7KcH72hkRPIAwT7wzsSsNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cocPfV0BbHwcXJ0RbYCjqzmridJFEvzCglLG9cyByHliucBwLD3rTxITpBLknFoZ6R0egfkOh4xdrGdzhQ/IIE8q+LifwUP8s+Cnbn2RY0n+Y6wqozf7GN4aXvoGO4XkEj60uxDLuo/iZox/8nlKi7Vsqan+ds6kxjNSkN1c87Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NgLoEkid; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NgLoEkid"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-28a5b8b12a1so45299185ad.0
        for <imx@lists.linux.dev>; Mon, 27 Oct 2025 03:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761559475; x=1762164275; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZ+q597kUNGqIq8Y48TGj7KcH72hkRPIAwT7wzsSsNE=;
        b=NgLoEkidMEb8Q2Vbm3guQwuXFjGk0RcukNHYzHvd2NedAbEAZowlvMj2hJpBtArdJ6
         2RnI+33VFOB9QzW2vxH3YWbM4KCZQxnItkpLXWlGygAr4MNaOvNnOE05/4o70O2iVCDZ
         MclGliMK+hrpjZt4y3NoE1pRoAlZMoDxRCxbLCkeE9U83450FNoMVgxDgIe7F7TF4mPT
         gyRcvYtWCiHHvrkh1zyJUGjcClzP+tXuDLOhlduj/zM0VKm2brmA2cjcJygsfRtQbdPx
         3MgvWlMMj1p4geXQGKIOB0hImF2aMZejM6jwxxWCygGtmQQB/v4DO6m5wrkt2UqkEZXx
         qZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761559475; x=1762164275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bZ+q597kUNGqIq8Y48TGj7KcH72hkRPIAwT7wzsSsNE=;
        b=uZomrkE+PcAZseRQqsVsllsDJL3s0GxV4JmqiqBGyZyfg1DJCL6GAXHHq5zdDmvCdj
         N/yo/vYTjML+aFGWEXHztulRxyp9yLrqjdDlKKnur5vnmD5xXOV8k3Bh75X/GAws019U
         D7r1ZhPrDuRhMuiYv4xNxo0hE0xOBBWYicHjyoTOoq3LOwza+yX4gA8HfYsM1Kqq+Scd
         q1LvC7nmVCgY1ppnASyWunoLqDMKnjdl/L6xfzMyNvaiBTRWP++zMH0jqpBsyYy4DoVZ
         jJhzvuMLS7KlH+DwkRfd9omY57b7aFCYzMLAbhbbRC41lZ22x4PFBAJXaKqeeMBLoREe
         9JYg==
X-Forwarded-Encrypted: i=1; AJvYcCUQY5Yp9LyZrC+ZFYviZSpevn2Jc1vfBim2HzJQWGucX8a0q3HSJmTwn8uamw64dzUIYUE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxyuxP26TZ96oI0zcYaksUjOB+vGwxbJeVryKEM/tqPplK9Epaw
	HNMRQ8PJbHxMdYmasaz9neKOeiN/8j643TA6DJRzai6nGv7y362e/tE3Qglbzds3N1CtTTUf7TK
	LhwS6bRZ4Ufs4GxwbxJXM5WEJ1JPNjcI=
X-Gm-Gg: ASbGncvegeQ+IaSaChYgBuCPhoN2bf74byqDc6tm7tYzXAGZF1U73mqAAJRAFtl24Bf
	DTYpmhKoOutOuMBR4AOQb+HQNI+oHZsR7sEkD96txMyZOCe+UPypn5WxuKLeMWNtDPEBzRzY4JX
	CDIdQonwW+7IliUjk6fSI1ia//G8OieMw6mVmqUA2Va0VgBlIxMuw8IvSq9IokG5fPcUuvRmLP7
	YYRJJQpw+I4rABOOMc6Boz1eX8dDQ0Mj/7p2dFSlJzxE12GZMTa3UcXkePXjHEFG0TghCjHf5J9
	9mhX2UEABI2JDw==
X-Google-Smtp-Source: AGHT+IGw9d1pKeseKB3lkBBW02LMj7kEUpU+h4+fmOwbWm1TH6VnLmuaWiTPpQmTwuE7imUFGIVOUC22U7kWNosjmns=
X-Received: by 2002:a17:902:ec88:b0:293:57e:cd70 with SMTP id
 d9443c01a7336-293057ecfddmr246648875ad.28.1761559475507; Mon, 27 Oct 2025
 03:04:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com> <20251017112025.11997-9-laurentiumihalcea111@gmail.com>
In-Reply-To: <20251017112025.11997-9-laurentiumihalcea111@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 27 Oct 2025 12:07:00 +0200
X-Gm-Features: AWmQ_bkbCiTHPHYYWScVXCVLYPxiC042hgQVGHC_daQ-QvhcSia1ZdA6dYYMWm4
Message-ID: <CAEnQRZAN0Kn=3hnw6dvCDsXXrQc17E87_hRT1R78ueKh+PzKjw@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] arm64: dts: imx8ulp: add sim lpav node
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2025 at 2:24=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Add DT node for the SIM LPAV module.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
