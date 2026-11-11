Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794394974;
	b=dlA0mO8ZjBCHFl2HLWPWYU2hr1o+rS9GJJyPtcrufoOUuunhMHNWtdHbKrT3xm2bIgS2
	 gpEdJX16VUOzpJqm71XPuoC/rF9GxJ4MlG5y0X9MPdfRVtOMu31FvWitRz0r1iFyN2NUa
	 hPx8zbCIJRF/Tc4ypWPSMMMZRExE9XSlC8Kpbfx1SVsFm6ctxaiyJtg1rZUxMD1TnHAf3
	 YsrtvybUMt6a1JRPaF0JwX6RrwlfiDmTsfCDB/VFI1pE86wdiNZO/N2v/A68QtOL+T7ci
	 npja9QPwXayHclaxrebAuBBXo+vIzzcRcsbDQLdK+pX0mzZfUekqmPf7dmb7kTGq0hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794394974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:X-Mailer:MIME-Version:From:To:Cc:Date:Subject:Content-Type:
	 Content-Transfer-Encoding;
	bh=6DQ1y9vg8ORZJ/bwoXjkvQtXiUjN7fzHpLiBzLwJqSs=;
	b=bSVKRgplk85+VnixISacxiBR3JdAgoVTpJCZXL+3JoO+im1ZUmHtH5kE6+JAjFOM1uT1
	 holx3U0a1QMYmMM6g1s2G0nv+A3bJJ6mvOGy8QMwVXm9IasRBn2JrrH8iFJoRSeEM2ewS
	 WHLEueDOcYcacC6ZC+IYLQbOJe+U3JZwndLzI+q4i0Z61JGeI5hLCq8jzKffr3kWYCf0A
	 VlEY7/x8Pc7RNg02sBZnadEAa/xDSZBKhnu4p5VZJAeU4EeUKfwUjf4nGy3ZRnLMnc982
	 NsvNUYcU8G75jayKzVQNKGTCIYqxo6YQqgn+LEUFMGixN/yr/V8YcOVTSKpW8yMYmpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C019U4kx;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EDD606A326
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 11:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1EDD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C019U4kx
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-37600b0db49so1158020eec.1
        for <imx@lists.linux.dev>; Wed, 11 Nov 2026 03:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794394973; x=1794999773; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6DQ1y9vg8ORZJ/bwoXjkvQtXiUjN7fzHpLiBzLwJqSs=;
        b=C019U4kxsLt/+srh6XnGH5l8axSckEfpC3Ny2STAcYsfKQVR2+3/uPnJs9qDXG9aKw
         +/n21DcpnCYCO3O6Z1hpRd+7HIcxC8kTV7ZT1hAeg+7yeqx8lpOvNDcnnCjDEn8423IF
         zV6JddLSRXAKjFqgY6/XQ3QLeMdHmF42Sq8r53IYGcs2MmWphV7VrJ4WXmu7q/E8A4ve
         iWiOWxZshbUzLsQEa1/c5rFzE+aqRSJGMr+bEVe9AwcMdcDEve6TT6v6EXPVG6d8Kck/
         KoW5GlEaB24+ZGnpj9OQItGpAtObAqQOXdtGe4VBn9gmFqTFSRxPoY/DENEdPe0QTEFS
         VoYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794394973; x=1794999773;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6DQ1y9vg8ORZJ/bwoXjkvQtXiUjN7fzHpLiBzLwJqSs=;
        b=Prh57FeOa0jEgur0VVM8STKxMaXLEraHJDespPOds+E6p52wGF3Jvzsn8Dx8KQR1tS
         tL3wOmM2aw3wFsqZORAx1CewDksI4HwzENb/yPJL43Q8kd/tpFto+SqfVp0A6MyHBYhv
         +jmhdF2b8Fb3dABHLDN/RBTyFbE8QB2w488htL8LcOu2kXXxC0A6izpxvKisMb5IF9mx
         K0/lZTxGy5YTPBlDS6+74AFreWRdPh0cGsPQIhmDeXQku9ts6hIUQwF6ViTLXUztzwiK
         IYJyzJtM6iqt3jUGayf9IxJhfc3wLRYlWROiHWWSmBm4Jbv+i9j/Z1iJKoOmtFJ4cYCM
         yF6g==
X-Forwarded-Encrypted: i=1; AL+hErGlIgomACkH6JIYPVABleC6r5KdYTQzKlSKSFPfEDwqOdvXHABknRHSmhao17CMflpY3Qc=@lists.linux.dev
X-Gm-Message-State: APuU4Z8Uoe6LWAeHo4vdENfLTtMPwVepLMe/rbobpS45dJBVO4EcsxxE
	kr1Y8kayLXWNJktaKrbVK3Z7Jvk37HhMyzN/LufH0mSX8XGAzbWeDX2H
X-Gm-Gg: AYBFou1bgFBYc0ofV99NfSZVtab9hvDWxTDpRkrs89my/8p30vndh3Ivegz4kLJch2Y
	3rXA244/IWbGDfqA1zwIwzqKYtLuzq1kPoR08s9JlLkde4jTRfP8Q11ssivuFyt8SVZobHuECuC
	MMKpSFIwX4MehWcV0dyPk0yYe/soH2YKN7gJ3zFexydd9dhuEZKakCJi118FdJL1ZJPZdZ9aBQV
	kyArX+I8EOVqgoj6BTxXHOoYsZvBpzzF8ujnYpmHas9gkHOp+3/AM2Cczv9yuUV4hdNwUqYw4mM
	bw46NOH4Yh3///+iSM0+KibaWoaBoK/xUZ3zHkKIzpohOnbmTq4gkjh0zI7V/Emhvs+jMNVISFj
	tuU8OJYLIAhnWQHcqs8RQlUjfxWy49BWZ0ZnlmfD5g2FCZ+kZFaQ3GHiHX2C6jhQJzP//rodzid
	2QJeoRBaznI9+jaM/JCB8VbuWWFV0MX8cM7BxDjjMZH3ovoh/4Xdblngcn9umoK0FHvOIJUMfyz
	iO3ioNMXPj7HUzrGjTVzZkIipSMZkviELRz85WsoyC99UWA8DBT1QKdlVvJWamoW0TutO0z5R/H
	Jw/jUAhbfVx6x2MnHq8e01sC5fLwStTpzLVU5B/1ngc00sv6QDa5ajwT+4ZLVQsZygyJARwBlYt
	t6PLXyxqwDYxZaJMQzTsBUIlNECXLISpE7844
X-Received: by 2002:a05:7301:e22:b0:36a:37:1404 with SMTP id 5a478bee46e88-37686d2fcd4mr3499154eec.13.1794394972545;
        Wed, 11 Nov 2026 03:02:52 -0800 (PST)
Received: from manush ([2406:7400:94:5368:19d0:c01f:d33b:214b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9e03sm30729052eec.23.2026.11.11.03.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:02:52 -0800 (PST)
Message-ID: <6af44b5c.67914289.fe7ab.6559@mx.google.com>
X-Mailer: git-send-email 2.46.2.windows.1
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: "Manush Prajwal" <manushprajwal555@gmail.com>
To: abelvesa@kernel.org, peng.fan@nxp.com, sboyd@kernel.org,
 mturquette@baylibre.com
Cc: s.hauer@pengutronix.de, Frank.Li@nxp.com, linux-clk@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: 11 Nov 2026 16:32:50 +0530
Subject: [PATCH] clk: imx: clk-imx95-blk-ctl: fix error unwinding in probe
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

In imx95_bc_probe(), bc->clk_apb is enabled via clk_prepare_enabl=
e().=0D=0AHowever, if subsequent operations fail:=0D=0A1. When !b=
c->pdata, devm_of_platform_populate() failure returns directly=0D=0A=
   without disabling bc->clk_apb.=0D=0A2. When clk_hw_data alloca=
tion fails, probe returns -ENOMEM directly=0D=0A   without disabl=
ing bc->clk_apb.=0D=0A3. The return values of devm_pm_runtime_ena=
ble() and=0D=0A   pm_runtime_resume_and_get() are ignored, potent=
ially proceeding with=0D=0A   an unresumed device or invalid runt=
ime PM state.=0D=0A4. If clock registration, of_clk_add_hw_provid=
er(), or child=0D=0A   devm_of_platform_populate() fails, executi=
on jumps to cleanup:,=0D=0A   which unregisters registered clocks=
 but fails to drop the runtime PM=0D=0A   reference acquired by p=
m_runtime_resume_and_get() and fails to call=0D=0A   clk_disable_=
unprepare(bc->clk_apb).=0D=0A=0D=0AFix these issues by:=0D=0A- Ha=
ndling devm_of_platform_populate() failure on !bc->pdata by jumpi=
ng=0D=0A  to err_clk_disable.=0D=0A- Jumping to err_clk_disable i=
f clk_hw_data allocation fails.=0D=0A- Checking the return values=
 of devm_pm_runtime_enable() and=0D=0A  pm_runtime_resume_and_get=
() and jumping to err_clk_disable on error.=0D=0A- Calling pm_run=
time_put_sync() in cleanup: if runtime PM is enabled.=0D=0A- Addi=
ng err_clk_disable to call clk_disable_unprepare(bc->clk_apb).=0D=0A=
=0D=0AFixes: 5224b189462f ("clk: imx: add i.MX95 BLK CTL clk driv=
er")=0D=0AFixes: b08217a25721 ("clk: imx95-blk-ctl: Fix synchrono=
us abort")=0D=0ASigned-off-by: Manush Prajwal <manushprajwal555@g=
mail.com>=0D=0A---=0D=0A drivers/clk/imx/clk-imx95-blk-ctl.c | 30=
 +++++++++++++++++++++++------=0D=0A 1 file changed, 24 insertion=
s(+), 6 deletions(-)=0D=0A=0D=0Adiff --git a/drivers/clk/imx/clk-=
imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c=0D=0Aindex =
bc6957299..ad386a48e 100644=0D=0A--- a/drivers/clk/imx/clk-imx95-=
blk-ctl.c=0D=0A+++ b/drivers/clk/imx/clk-imx95-blk-ctl.c=0D=0A@@ =
-394,17 +394,29 @@ static int imx95_bc_probe(struct platform_devi=
ce *pdev)=0D=0A 	}=0D=0A=0D=0A 	bc->pdata =3D of_device_get_match=
_data(dev);=0D=0A-	if (!bc->pdata)=0D=0A-		return devm_of_platfor=
m_populate(dev);=0D=0A+	if (!bc->pdata) {=0D=0A+		ret =3D devm_of=
_platform_populate(dev);=0D=0A+		if (ret)=0D=0A+			goto err_clk_d=
isable;=0D=0A+=0D=0A+		return 0;=0D=0A+	}=0D=0A=0D=0A 	clk_hw_dat=
a =3D devm_kzalloc(dev, struct_size(clk_hw_data, hws, bc->pdata->=
num_clks),=0D=0A 				   GFP_KERNEL);=0D=0A-	if (!clk_hw_data)=0D=0A=
-		return -ENOMEM;=0D=0A+	if (!clk_hw_data) {=0D=0A+		ret =3D -EN=
OMEM;=0D=0A+		goto err_clk_disable;=0D=0A+	}=0D=0A=0D=0A 	if (bc-=
>pdata->rpm_enabled) {=0D=0A-		devm_pm_runtime_enable(&pdev->dev)=
;=0D=0A-		pm_runtime_resume_and_get(&pdev->dev);=0D=0A+		ret =3D =
devm_pm_runtime_enable(&pdev->dev);=0D=0A+		if (ret)=0D=0A+			got=
o err_clk_disable;=0D=0A+=0D=0A+		ret =3D pm_runtime_resume_and_g=
et(&pdev->dev);=0D=0A+		if (ret)=0D=0A+			goto err_clk_disable;=0D=0A=
 	}=0D=0A=0D=0A 	clk_hw_data->num =3D bc->pdata->num_clks;=0D=0A@=
@ -462,6 +474,12 @@ static int imx95_bc_probe(struct platform_dev=
ice *pdev)=0D=0A 		clk_hw_unregister(hws[i]);=0D=0A 	}=0D=0A=0D=0A=
+	if (pm_runtime_enabled(bc->dev))=0D=0A+		pm_runtime_put_sync(&p=
dev->dev);=0D=0A+=0D=0A+err_clk_disable:=0D=0A+	clk_disable_unpre=
pare(bc->clk_apb);=0D=0A+=0D=0A 	return ret;=0D=0A }=0D=0A=0D=0A-=
- =0D=0A2.46.2.windows.1

