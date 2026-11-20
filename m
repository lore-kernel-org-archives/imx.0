Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795176796;
	b=uWHnrdriWb0YLO2sv1ElCSc0tO3LMA2sX66Q27TtJSGvgruxakH8/tNRFXsnhQhq4PVg
	 VMprSrzgma69GWahODveiRcS12iSU1XTJrIeP9mf+GCIh5nWDoZ/HhthLOv3Ouut+tQuD
	 Qv3rp7XI/0c6lZ0iUacjcsLwJphbwzKxfEHNLCUxCSxYg/n8mSpnvooQQLYP8YaGH81kf
	 zZAPiXsuJvpeR+JSti2ebft1rJnZ8IdEKQhkzl8RT6rONvdfIMOZ1zTtVwl2zbPQG37ur
	 NUXEGQGpmRRZ9MA1Q8cZqnTTckyx1IRNpaU0PoOnqLc8RFkX/0xrkaEoAqOdfqohLeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795176796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fcQffss7eE/XcLf/4aHYjQKeo+L9JMp703XSJQyfycM=;
	b=IFnAV332/5I8M7nQbUj/OpFxZsTXB3mpz+9Z/mFYzcBNCrNxUrYap0pAoohDXceF5jbM
	 sqq8mC4CczKQAZaqmISxtvN4qug2UewKbKRvXlBFemj3TbI1H1K4TA8N1J57IR1bH/FUl
	 A0SCt+ETfdCD5SGBRifGxWmOk7CB0Ay0FFJKq/HOvUByJHEsnzMonldh3c7zK4D5PAJ/l
	 HNspY9espI0Cg3P6cKbTpFwUugGzcwZCfEwIN/KkiAGVXGBYVdy0gpIlXao9pgTVaLb1X
	 PfTlUIXrdCb3Z1cSD/PlbIiQS7oEz0w/9frvMHyRh+0bLI7gq/jyrRohYBH8l/JR2ww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mbzL2+WQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76EE606A32A
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 12:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D76EE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mbzL2+WQ
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c14f7768acso590843e87.3
        for <imx@lists.linux.dev>; Fri, 20 Nov 2026 04:13:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795176794; cv=none;
        d=google.com; s=arc-20260327;
        b=PTxch3g1xko+/GhfZlTP2JOKn6q0O3Gkn2yKwhgHSQxm00HvRXJasDlsCl8i4sW3vt
         GURsRqjkPijP1cifbGtd4tQ6eNlx1wyHScaJuu+C3at9VKYY8F71+2q3XytXXwmCnBNR
         CMkFk3G7HiKUk/EmRyuMX+fdyuOTgU3TdfM5DPwjXtamJMMBrty+F79aFrOVECvx2W29
         u73iC5d71bokmvhvDT+aia5H01jrphm32u/6NL/KvYc6/e6W/9UHt809/Ihzs7iEKBsu
         hh2fqGNAfPkgXbiGzm6cB8pZ8FL8msGlIdYPgtZlweuMiFownn29VTvGqRX3ZpEdQjxG
         FnRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fcQffss7eE/XcLf/4aHYjQKeo+L9JMp703XSJQyfycM=;
        fh=akgOFG6CJ91vBI1HZDb7P0GQF1oQpLg0EWBWooLtX/4=;
        b=OBxDXDq1Dil7uTpzDoBTvaeJl3Gct+xiKh4RAIsobp68D4aonhvOEfaeFIeLBB2c4D
         xfg0QXcnZcDmXqsenlDC8TNJk54iwmGVhmm0iHbSS3vzHC8USSk7e1/cAV3RwE4M4n3k
         IGikTt6seaKwJhqw8bGpbD+l6LxEwGs7DR7EWsWjbPnpWqEJGA6n+ocCwzNcTGs9E/o3
         DoVVLUXeK+Yscx7u3oJFv1rnMS3or1MplYtiexjII852OfVjtkW4Q3JPf08l+ffU20+w
         pe2Ou2SFRjWM6q5dUmnMrZRmUt0sf+WwHj2M/AGiT6fymr6YKbgnIl6825+K1+/YxHZt
         8j5Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795176794; x=1795781594; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fcQffss7eE/XcLf/4aHYjQKeo+L9JMp703XSJQyfycM=;
        b=mbzL2+WQwVpw16H2fgq9/bUdgUKyaaojbFjXtYuLmE+9yx1HhMM/ESdj0vq8iIjJGN
         IaJdwPhzFhdFKCOMnA9BHOgNEsTyYo4IwupMMikaeoBP9Pi8vZUTQdSnsL+JMvVJ6gRp
         kdmxdkQcsQ/3/2Q1shUJEl5bM2+usFGzOTCuaH8C1JYRKHe0UlNubq1/w5x+/7onKlAX
         OpBX+Itqn7njMeiqJ9Jw0L8jUkcPEIlGAP52lTUyga1L1MNkdSPGCIZfP1Dos6oBzgFZ
         dAI/8nIOV/m4X5+lioUiwY3DytXr6HUmdMaD/aJhMWkNgJhP1yUJR+lM9WLfCSFTo+AW
         NQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795176794; x=1795781594;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fcQffss7eE/XcLf/4aHYjQKeo+L9JMp703XSJQyfycM=;
        b=dY01x2YHkxDc4mTmaDPczqfFQxDaaoMpVu0HUYvuCOtZWvaUwcKqhEweyipuUP4SFi
         m7NdKx7H06mK3ND6rE09KUPXt8/RioNliT3ii+xGC3yAxfQ2x2D5GEQ7k7LnwM5fdt1g
         WRZRSdWOnV2eLYpi3XOkjVZVaRIAJ9ubfsWEQ+jU37pgPyKj+Cll0mxiTOCBU71O26zY
         7WAaxs61xi8ubObcAWbDpKj0v+DAFiT7ACkKWg3qM4/r/HKQFrCWyyUrEtmtHrS8c2H7
         bTE99+3ij9Xg9tpXNeJzHD9lXPcXVa2tNdLszJbEWk5gU+keaLoMdi7WPXxOOWjRynyo
         Z1VQ==
X-Forwarded-Encrypted: i=1; AL+hErElRborDGW4eKg8SH/5UrOE4qj3yAdz/dxeV0Gs18djYX+5GVrQdVuw2tjbpMD2vFZ6IVw=@lists.linux.dev
X-Gm-Message-State: APuU4Z927qzZ/snYSkpx+UpxRiAjNSz63QP0pmxAUZiE8J5WkMqEa6oc
	SlyFrmuqRQw19mdpn+Kq9zDlf67o9le1ewIWk6rKc0I644pSlGZb0SWxT1sAylDQtsrYAkcdsFa
	5a0R4aLAxrpCL6v6RBa/tCmvWarWrfbg=
X-Gm-Gg: AZFdTZe0nP4+bM0RWavYlYNTEHsn0KobpuYR6YEAUUtf/2tCps3ZMF7chKQvKNrJjrj
	hNZN9O6OxsP5fYq3T+npRBdUSehWfl9PX7GotfZMi4JvJLYJZODEuNfj4HC3yT07iY/DOg14RWV
	ZZIROYpnYL70if95OhVDhx3Um0rzyRhjC70ESSV4TIPK0bVdgI5dneb94ZuN4RvtAlSk1Uz8Th+
	+IOxGxzeHxvOKNzvfCEiy9sROWmt+nKh6Cy7B4RRD/C4lPsLyIViSDgsUuCtkyscJ/fgkOjTgRE
	9M1PmIE8VHN/lhs1Eq3R1Qf/veJkf7B1x8KRQ1vSa6LxK5YYk0lIJDtEnus1t1UX+D31OpDDjrn
	JIwyeKWX1r7I/Ih9jeFzspPLQy/afIqGhfN7xPLc3gLliNJPJI2zrRNqEl5deeab+bdqTHhZzTk
	6oniS8MuD8faEe72jSXNLfrRsZ
X-Received: by 2002:a05:6512:a78d:10b0:5c1:46c8:4797 with SMTP id
 2adb3069b0e04-5c1bc7d1153mr604351e87.17.1795176793721; Fri, 20 Nov 2026
 04:13:13 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261120-b4-imx937-frdm-scmi-pinctrl-v2-1-911487a14300@oss.nxp.com>
In-Reply-To: <20261120-b4-imx937-frdm-scmi-pinctrl-v2-1-911487a14300@oss.nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 20 Nov 2026 09:13:02 -0300
X-Gm-Features: AclHuK94xOx7RNiFqLMbC6LRL1dQuiXB8r985LNFD94WYgXQMJhVIsyDHnh7OLI
Message-ID: <CAOMZO5D4KV_v7w5tcLn44UsMxpOFDQwr48b24Mx1Fy+v_J-WFQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: imx: Use of_device_id match table for per-SoC data
To: joy.zou@oss.nxp.com
Cc: Peng Fan <peng.fan@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Jacky Bai <ping.bai@nxp.com>, Ye Li <ye.li@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joy Zou <joy.zou@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 7:46=E2=80=AFAM <joy.zou@oss.nxp.com> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Replace the hardcoded of_machine_is_compatible() if-else chain and the
> static string allowlist with a proper of_device_id match table carrying
> per-SoC data via the .data field.
>
> This eliminates the static local variable anti-pattern for daisy_off
> (lazy-initialized, shared across instances) and adopts the idiomatic
> kernel of_machine_get_match_data() APIs.
>
> A new pinctrl_scmi_imx_data struct captures the daisy register offset
> for future extensibility when new SoCs may not use register-offset based
> daisy configuration.
>
> No functional changes.
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Joy Zou <joy.zou@nxp.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
