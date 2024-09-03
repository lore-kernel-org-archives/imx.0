Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17F81CA68B
	for <imx@lists.linux.dev>; Tue,  3 Sep 2024 13:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725368521; cv=none; b=ujZn227hZtYcEg32VY3Wo21A2p2OVFZkDLMSzjSinCOjKqab2H2TkNA8lSUZiLrx2scr6lmLJunXJVSj3s19Myw1Qy4IprLD4a24whhEgLKaz1MYdrqaXGxRe4BSlufrn27OeQqZ5FtPBodXPa8z+lY5jCBRAcICNfLNkpErrkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725368521; c=relaxed/simple;
	bh=51XZL1zpa9+ZugG0MuTKWPjrQIyg9Ca1YCU0ZCUyuio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qfJ0/gnVFR/LIDquQTqAmww3GLzzD8O3W72IA7c8PTwqUGzcQbSR67ijHMBlLMus9lLUDWcgILsc/atL1y5+RjKSpFGmdM8RSN3tG6D+3Fyyq3NHyhHdqWsfAuYE04BGWuBz+Js9BTZdM0r9+iEmYuAEdVOMfCDU8jw9yElhCp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ioN/rYLV; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ioN/rYLV"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5353cd18c20so6370271e87.0
        for <imx@lists.linux.dev>; Tue, 03 Sep 2024 06:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725368518; x=1725973318; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VNCoDBWiaDkhcsMePwXkrH4rh6xCaLi3QD6d60u1M0k=;
        b=ioN/rYLVc96uT4RFxqvlM5VxRHFQfq2JTt0pZzU7sXdn5CizYa5A11BsgPzZog1kvA
         jWHtri/PtN9n60ayohonVaN7nW6maRP0WM1kCDYFkqRR5uA+E3uaUDH9Hn53t1SjepY8
         7OK80C58VOUHaE/QyJlpOswqWUxm0mybJWtBZ0LEnxlDKOp6pEwV5U4/1SqP6AnGyC9p
         1ndZR4iWvQcCLlAw2ChgBdGRk0Ig1s2wxRiPLbjMXdd4ZnTU/zZPZS9+qyJqW/oVprhC
         cZgTkqcxBL9x33aGcQGS2qhZudDuylFl9Rz3EWOhe8gGwjMa4f7r7humFj0ZCLHmEllD
         CpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725368518; x=1725973318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VNCoDBWiaDkhcsMePwXkrH4rh6xCaLi3QD6d60u1M0k=;
        b=wX5FxEqYUl8/bVvwvCJR+DCKwVbu/ZUfQFpiKHq218nynYEXjyO4RjYHATFGQlWB8n
         qpUWwPlNc0ikqyA3Na9SQPbRzpn7m2Agt98EbIBsWk6D0U5lrhGJ1tX58j5bZXC2202g
         LhKpMNsoBgJKlTdIL+MkSVsDUEmrqZljp4wT9p5IKkOOO+e7aRIyOrjwE/A7x0g2s8Bm
         T0bEnSXFHHY0loVgoP6aEDCYqTjDeIcyRswfZEgldkTQAFcZNtG2Ep1hRU0vX41kNJyx
         k+ZbwMzFtagnIJdaOXta9aFDHOUf2lQko699HSd/ngDTr1iSqchtc8om1Ds2P5wZVmVR
         LV5A==
X-Forwarded-Encrypted: i=1; AJvYcCVkmWDDMsW1Y4Ek1BdHyzCY0g/8dn5598XRp0vGwAwV3dI4Yq3du4Wjef1mEV+n+UpQa+8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxbTMAeTSGCd1QCNM1bCBvItAk8IvfhA6e+VeczWt720xpnaEuc
	VT17HvgXq+IrJX77sI2F2Ovunbm1KbTklKowXJKebaTyarjaQCuhgZTYHYJ/nD5jmQQ/Tl1JbfM
	B7hZUr38o0NIrzVISNTDYMqX712c=
X-Google-Smtp-Source: AGHT+IH46cK4NeXPdEqmfU2Trxz2EWki+TuWP1ltUeNhM80T1XWTNZT5fdoKzGW1CXcqoGBpxBr6zBmSxc/j10SM9BU=
X-Received: by 2002:a05:6512:1047:b0:52c:c5c4:43d2 with SMTP id
 2adb3069b0e04-53546b910a0mr9807468e87.47.1725368517402; Tue, 03 Sep 2024
 06:01:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1725350397-19527-1-git-send-email-hongxing.zhu@nxp.com> <1725350397-19527-2-git-send-email-hongxing.zhu@nxp.com>
In-Reply-To: <1725350397-19527-2-git-send-email-hongxing.zhu@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 3 Sep 2024 10:01:46 -0300
Message-ID: <CAOMZO5DsUdus8b6F+vz_g7+tZum9e5WPmFCg8zts7qDU6DToTQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: clock: nxp,imx95-blk-ctl: Add
 compatible string for i.MX95 HSIO BLK CTRL
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com, 
	sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, imx@lists.linux.dev, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

On Tue, Sep 3, 2024 at 5:21=E2=80=AFAM Richard Zhu <hongxing.zhu@nxp.com> w=
rote:
>
> Add compatible string "nxp,imx95-hsio-blk-ctl" for iMX95.
>
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.ya=
ml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> index 2dffc02dcd8b..638241f6749f 100644
> --- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> +++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> @@ -17,6 +17,7 @@ properties:
>            - nxp,imx95-display-csr
>            - nxp,imx95-camera-csr
>            - nxp,imx95-vpu-csr
> +          - nxp,imx95-hsio-blk-ctl

Please keep the entries in alphabetical order.
